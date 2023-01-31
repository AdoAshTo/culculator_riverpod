import 'package:culculator/models/calculator.dart';
import 'package:culculator/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
        (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier()
      : super(
          const Calculator(
            shouldAppend: false,
            equation: '',
            result: '',
          ),
        );
  void append(String buttonText) {
    final equation = () {
      if (Utils.isOperator(buttonText) &&
          Utils.isOperatorAtEnd(state.equation)) {
        final subEquation =
            state.equation.substring(0, state.equation.length - 1);
        return subEquation + buttonText;
      } else if (!state.shouldAppend) {
        return state.equation == '' ? buttonText : state.equation + buttonText;
      } else {
        return state.equation + buttonText;
      }
    }();
    // final result = () {
    if (Utils.isOperatorAtEnd(state.equation) &&
        !Utils.isOperator(buttonText)) {
      state = state.copyWith(equation: equation);
      calculattion();
    }
    // }();
    final shouldAppend = () {
      if (!state.shouldAppend && buttonText == '-') {
        return state.shouldAppend;
      } else {
        return true;
      }
    }();
    state = state.copyWith(equation: equation, shouldAppend: shouldAppend);
  }

  void reset() {
    state = state.copyWith(shouldAppend: true, equation: '', result: '');
  }

  void resultRefresh() {}
  void delete() {
    final equation = state.equation.substring(0, state.equation.length - 1);
    if (equation.isEmpty) {
      reset();
    }
    state = state.copyWith(equation: equation);
    if (Utils.isOperatorAtEnd(equation)) {
      calculattion(isOperatorAtEnd: true);
    } else {
      calculattion();
    }
  }

  void equal() {
    if (state.result.isNotEmpty) {
      calculattion();
      state = state.copyWith(equation: state.result, result: '');
    }
  }

  void calculattion({bool isOperatorAtEnd = false}) {
    final equation = () {
      if (isOperatorAtEnd) {
        return state.equation
            .substring(0, state.equation.length - 1)
            .replaceAll('⨯', '*')
            .replaceAll('÷', '/');
      } else {
        return state.equation.replaceAll('⨯', '*').replaceAll('÷', '/');
      }
    }();

    Parser parser = Parser();

    try {
      Expression expression = parser.parse(equation);
      ContextModel contextModel = ContextModel();
      final result =
          '${expression.evaluate(EvaluationType.REAL, contextModel)}';
      if (result.endsWith('.0')) {
        state = state.copyWith(result: result.substring(0, result.length - 2));
      } else {
        state = state.copyWith(result: result);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
