import 'package:culculator/widgets/buttons_row_widget.dart';
import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          ButtonsRowWidget(buttonsRow: ['AC', '()', '%', '÷']),
          ButtonsRowWidget(buttonsRow: ['7', '8', '9', '⨯']),
          ButtonsRowWidget(buttonsRow: ['4', '5', '6', '-']),
          ButtonsRowWidget(buttonsRow: ['1', '2', '3', '+']),
          ButtonsRowWidget(buttonsRow: ['0', '.', '<', '='])
        ],
      ),
    );
  }
}
