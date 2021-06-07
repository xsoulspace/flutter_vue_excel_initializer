library excel_initializer;

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart';

class ExcelInitializer extends StatelessWidget {
  const ExcelInitializer({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        window.dispatchEvent(
          Event('intialize-excel'),
        );
      },
      child: child,
    );
  }
}
