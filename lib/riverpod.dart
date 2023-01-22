import 'package:culculator/models/calculator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider =
    StateNotifierProvider<CalculatorNotifier, Calculator>(
        (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<Calculator> {
  CalculatorNotifier()
      : super(
          const Calculator(
            shouldAppend: true,
            equation: '0',
            result: '0',
          ),
        );
  void append(String buttonText) {
    final equation = () {
      return state.equation == '0' ? buttonText : state.equation + buttonText;
    }();
    state = state.copyWith(equation: equation);
  }
}
