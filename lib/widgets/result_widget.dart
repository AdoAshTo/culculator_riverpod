import 'package:culculator/riverpod.dart';
import 'package:culculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResultWidget extends ConsumerWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.watch(calculatorProvider);
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              calculator.equation,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 72,
                color: MyColors.textColor,
              ),
            ),
          ),
          Text(
            calculator.result,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 36,
              color: MyColors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
