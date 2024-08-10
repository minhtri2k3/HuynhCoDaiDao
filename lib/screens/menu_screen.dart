import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';
import 'base_screen.dart';

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
