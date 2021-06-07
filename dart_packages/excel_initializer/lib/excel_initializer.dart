library excel_initializer;

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart';

final instializeExcelEvent = Event('initialize-excel');

/// Dart analogue of
/// new CustomEvent("excel-initialized", {  detail: { isIntialized: false }})
///
final instializedExcelEvent = CustomEvent(
  'excel-initialized',
  detail: {"isIntialized": false},
);

class ExcelInitializer extends StatelessWidget {
  static void initializeExcel({ValueChanged<bool?>? onInitialized}) {
    window.addEventListener(
      instializedExcelEvent.type,
      (event) => onInitialized
          ?.call((event as CustomEvent?)?.detail['isIntialized'] as bool?),
    );
    window.dispatchEvent(
      instializeExcelEvent,
    );
  }

  const ExcelInitializer({
    required this.child,
    this.onInitialized,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final ValueChanged<bool?>? onInitialized;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        initializeExcel(onInitialized: onInitialized);
      },
      child: child,
    );
  }
}
