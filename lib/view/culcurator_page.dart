import 'package:culculator/riverpod.dart';
import 'package:culculator/utils/colors.dart';
import 'package:culculator/widgets/buttons_widget.dart';
import 'package:culculator/widgets/result_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CulCulatorPage extends ConsumerWidget {
  const CulCulatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          margin: EdgeInsets.only(left: 10),
          child: Text('電卓'),
        ),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: ResultWidget()),
          Expanded(flex: 2, child: ButtonsWidget()),
        ],
      )),
    );
  }
}
