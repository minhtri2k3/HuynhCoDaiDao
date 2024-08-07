import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/modules/message/message_category_widget.dart';

class MessageCategoryScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const MessageCategoryScreen({
    required this.actionTitle,
    required this.actionUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: actionTitle,
      body: MessageCategoryWidget(
        actionUrl: actionUrl,
      ),
    );
  }
}
