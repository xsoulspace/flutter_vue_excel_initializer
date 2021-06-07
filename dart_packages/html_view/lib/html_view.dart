library flutter_vue_event_bus;

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart';

import 'src/utils/ui.dart' if (dart.library.html) 'dart:ui' as ui;

typedef PostMessage = void Function(
  dynamic message,
  String targetOrigin, [
  List<MessagePort>? messagePorts,
]);
typedef RePostMessage = void Function(PostMessage postMessage);

class HtmlView extends StatefulWidget {
  const HtmlView({
    required this.src,
    required this.onMessage,
    required this.postMessage,
    required this.targetOrigin,
    this.onWindowLoad,
    Key? key,
  }) : super(key: key);
  final String src;
  final String targetOrigin;
  final ValueChanged onMessage;
  final RePostMessage postMessage;
  final ValueChanged<Event>? onWindowLoad;
  @override
  _HtmlViewState createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  late final IFrameElement iFrameElement;
  String get viewKey => 'view_${widget.src}';
  @override
  void initState() {
    iFrameElement = IFrameElement()
      ..src = widget.src
      ..style.border = 'none'
      ..onLoad.listen(
        (event) => widget.onWindowLoad?.call(event),
      );
    ui.platformViewRegistry.registerViewFactory(
      viewKey,
      (int viewId) => iFrameElement,
    );
    final postMessage = iFrameElement.contentWindow?.postMessage;
    if (postMessage != null) {
      widget.postMessage(postMessage);
    } else {
      throw Exception(
        'postMessage is null. Maybe iFrame is not initialized..',
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'webpage',
      key: Key(viewKey),
    );
  }
}
