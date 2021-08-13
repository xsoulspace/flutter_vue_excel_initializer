library excel_initializer;

import 'package:flutter/widgets.dart';

import './src/excel_initializer_io.dart'
    if (dart.library.js) './src/excel_initializer_js.dart';

class ExcelInitializerButton extends StatelessWidget {
  const ExcelInitializerButton({
    this.onInitialized,
    required this.child,
    Key? key,
  }) : super(key: key);
  final ValueChanged<bool?>? onInitialized;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ExcelInitializer(
      onInitialized: onInitialized,
      child: child,
    );
  }
}
