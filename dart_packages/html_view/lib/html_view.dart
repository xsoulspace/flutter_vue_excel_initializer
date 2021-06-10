library flutter_vue_event_bus;

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart';

import 'src/utils/ui.dart' if (dart.library.html) 'dart:ui' as ui;

typedef PostMessage = void Function(
  dynamic message,
  String targetOrigin, [
  List<MessagePort>? messagePorts,
]);
typedef DispatchEvent = void Function(Event event);
typedef RepostMessage = void Function(PostMessage postMessage);
typedef RedispatchEvent = void Function(DispatchEvent dispatchEvent);

class HtmlView extends StatefulWidget {
  const HtmlView({
    required this.src,
    required this.onMessage,
    required this.targetOrigin,
    this.postMessage,
    this.dispatchEvent,
    this.onWindowLoad,
    Key? key,
  }) : super(key: key);
  final String src;
  final String targetOrigin;
  final ValueChanged onMessage;
  final RepostMessage? postMessage;
  final RedispatchEvent? dispatchEvent;
  final ValueChanged<MessageEvent>? onWindowLoad;
  @override
  _HtmlViewState createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  late final IFrameElement iFrameElement;
  String get viewKey => 'view_${widget.src}';
  late final StreamSubscription<Event> subscription;
  @override
  void initState() {
    iFrameElement = IFrameElement()
      ..src = widget.src
      ..style.border = 'none';
    ui.platformViewRegistry.registerViewFactory(
      viewKey,
      (int viewId) => iFrameElement,
    );
    subscription = iFrameElement.onLoad.listen(
      (event) {
        widget.onWindowLoad?.call(event as MessageEvent);
        final contentWindow = iFrameElement.contentWindow;
        if (contentWindow == null) {
          throw Exception(
            'contentWindow is null. Maybe iFrame is not initialized..',
          );
        }
        final postMessage = contentWindow.postMessage;
        final dispatchEvent = contentWindow.dispatchEvent;
        widget.postMessage?.call(postMessage);
        widget.dispatchEvent?.call(dispatchEvent);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: viewKey,
    );
  }
}
