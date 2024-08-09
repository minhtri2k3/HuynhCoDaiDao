import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/modules/message/message_category_widget.dart';

class MessageCategoryScreen extends StatelessWidget {
  final String Message_actionTitle;
  final String Message_actionUrl;

  const MessageCategoryScreen({
    required this.Message_actionTitle,
    required this.Message_actionUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: Message_actionTitle,
      body: MessageCategoryWidget(
        Message_actionUrl: Message_actionUrl,
      ),
    );
  }
}
