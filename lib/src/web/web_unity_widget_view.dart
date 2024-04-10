import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebUnityWidgetView extends StatefulWidget {
  final Uri? uri;

  const WebUnityWidgetView({
    Key? key,
    required this.onWebViewCreated,
    required this.unityOptions,
    this.uri,
  }) : super(key: key);

  final Map<String, dynamic> unityOptions;
  final void Function() onWebViewCreated;

  @override
  State<WebUnityWidgetView> createState() => _WebUnityWidgetViewState();
}

class _WebUnityWidgetViewState extends State<WebUnityWidgetView> {
  late final WebViewController _controller = WebViewController()
    ..loadRequest(
      widget.uri ?? Uri.parse('${_getBasePath()}/UnityLibrary/index.html'),
    );

  @override
  void initState() {
    super.initState();
    widget.onWebViewCreated();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  static String _getBasePath() {
    var prefix = Uri.base.origin + Uri.base.path;
    if (prefix.endsWith("/")) prefix = prefix.substring(0, prefix.length - 1);
    return prefix;
  }
}
