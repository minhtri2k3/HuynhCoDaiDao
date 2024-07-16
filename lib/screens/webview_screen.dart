import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';


import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'base_screen.dart';

class WebviewScreen extends StatefulWidget {
  final String actionTitle;
  final String actionUrl;

  const WebviewScreen({

    required this.actionTitle,
    required this.actionUrl,
  }) ;

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final Box _appData = Hive.box('appData');

  late WebViewController _webviewController;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      key : ValueKey('WebviewScreen'),
      title: widget.actionTitle, body: Container( child: Text('This is the webview'),),

    );
  }
}
