import 'dart:async';

import 'package:universal_html/html.dart' as html;

class Sse {
  final html.EventSource eventSource;
  final StreamController<String> streamController;
  Sse(this.eventSource, this.streamController);

  factory Sse.connect({
    required String channel,
    required String id,
    required String type,
    bool withCredentials = false,
    bool closeOnError = true,
  }) {
    final Uri uri = Uri.parse(
        'http://192.168.8.101:3502/service/v1/stream?channel=$channel&id=$id');
    final StreamController<String> streamController =
        StreamController<String>();
    final eventSource =
        html.EventSource(uri.toString(), withCredentials: withCredentials);
    eventSource.addEventListener(
        type,
        (html.Event event) =>
            {streamController.add((event as html.MessageEvent).data)});
    if (closeOnError) {
      eventSource.onError.listen((event) {
        eventSource.close();
        streamController.close();
      });
    }
    return Sse(eventSource, streamController);
  }

  Stream get stream => streamController.stream;

  bool isClosed() => streamController.isClosed;

  void close() {
    eventSource.close();
    streamController.close();
    print("SSE closed");
  }
}
