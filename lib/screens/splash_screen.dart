import 'package:flutter/material.dart';
import 'package:huynhcodaidaover2/ui_components/linear_gradients.dart';

import '../ui_components/linear_gradients.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080,
        height: 1920,
        decoration: BoxDecoration(
          gradient: LinearGradients.main,
        ),
        child: Center(
          child: Container(
            width: 600,
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 20,
                  spreadRadius: 10,
                  offset: Offset(0, 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
