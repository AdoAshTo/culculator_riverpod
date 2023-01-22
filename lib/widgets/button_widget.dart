import 'package:culculator/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function()? function;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            backgroundColor: getButtonColor(text),
            shape: const CircleBorder(side: BorderSide.none),
          ),
          child: text == '<'
              ? const Icon(Icons.backspace_outlined,color: MyColors.textColor,)
              : Text(
                  text,
                  style: TextStyle(
                    color: MyColors.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
                ),
        ),
      ),
    );
  }

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
}
