import 'package:flutter/material.dart';

class ExcelInitializer extends StatelessWidget {
  const ExcelInitializer({
    this.onInitialized,
    required this.child,
    Key? key,
  }) : super(key: key);
  final ValueChanged<bool?>? onInitialized;
  final Widget child;
  @override
  Widget build(BuildContext context) => const Text('Excel is not available');
}
