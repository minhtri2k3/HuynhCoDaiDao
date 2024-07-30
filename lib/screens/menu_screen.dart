import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/widgets/menu_widget.dart';

class MenuScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const MenuScreen({
    required this.actionTitle,
    required this.actionUrl,
  });


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: actionTitle,
      body: MenuWidget(
        actionUrl: actionUrl,
      ),
    );
  }
}
