class Calculator {
  final bool shouldAppend;
  final String equation;
  final String result;

  const Calculator({
    required this.shouldAppend,
    required this.equation,
    required this.result,
  });

  Calculator copyWith({
    bool? shouldAppend,
    String? equation,
    String? result,
  }) =>
      Calculator(
        shouldAppend: shouldAppend ?? this.shouldAppend,
        equation: equation ?? this.equation,
        result: result ?? this.result,
      );
}
