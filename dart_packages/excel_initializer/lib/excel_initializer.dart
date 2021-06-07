library excel_initializer;

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart';

final instializeExcelEvent = Event('initialize-excel');

class ExcelInitializer extends StatelessWidget {
  static void initializeExcel() => window.dispatchEvent(
        instializeExcelEvent,
      );
  const ExcelInitializer({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: initializeExcel,
      child: child,
    );
  }
}
