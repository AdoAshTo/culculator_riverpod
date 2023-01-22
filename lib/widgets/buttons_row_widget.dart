import 'package:culculator/riverpod.dart';
import 'package:culculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonsRowWidget extends ConsumerWidget {
  final List<String> buttonsRow;

  const ButtonsRowWidget({
    super.key,
    required this.buttonsRow,
  });

  Color getButtonColor(String buttonText) {
    switch (buttonText) {
      case 'AC':
      case '()':
      case '%':
      case '÷':
      case '⨯':
      case '-':
      case '+':
      case '=':
        return MyColors.operators;
      default:
        return MyColors.secondaryColor;
    }
  }

  void onClickedButton(String buttonText, WidgetRef ref) {
    final calculator = ref.read(calculatorProvider.notifier);
    calculator.append(buttonText);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Row(
        children: buttonsRow
            .map<Widget>(
              (text) => Expanded(
                child: Container(
                  height: double.infinity,
                  margin: const EdgeInsets.all(6),
                  child: ElevatedButton(
                    onPressed: () => onClickedButton(text, ref),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor(text),
                      shape: const CircleBorder(side: BorderSide.none),
                    ),
                    child: text == '<'
                        ? const Icon(
                            Icons.backspace_outlined,
                            color: MyColors.textColor,
                          )
                        : Text(
                            text,
                            style: const TextStyle(
                              color: MyColors.textColor,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
