import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;

  const AlertDialogWidget({
    required this.title,
    required this.content,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text('Lỗi đăng nhập'),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      content: Text(content),
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
  }
}
