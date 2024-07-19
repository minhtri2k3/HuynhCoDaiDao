import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huynhcodaidaover2/blocs/login_screen_event.dart';
import 'package:huynhcodaidaover2/blocs/login_screen_state.dart';
import 'package:huynhcodaidaover2/blocs/login_screen_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Color _textFormFieldColor = Colors.white;
  bool _obscureOption = true;
  String _obscureOptionText = 'Hiện';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {
        if (state is LoginScreenInProgress) {
          _textFormFieldColor = Colors.white70;
        }

        if (state is LoginScreenFailure && state.error is DioException) {
          DioException error = state.error as DioException;
          DioExceptionType errorType = error.type;
          String content;

          if (errorType == DioExceptionType) {
            content = 'Vui lòng kiểm tra số điện thoại hoặc mật khẩu.';
          } else {
            content = 'Vui lòng kiểm tra kết nối Internet.';
          }

          AlertDialog alertDialog = AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            titlePadding: EdgeInsets.fromLTRB(100, 100, 100, 50),
            contentPadding: EdgeInsets.fromLTRB(100, 50, 100, 50),
            buttonPadding: EdgeInsets.fromLTRB(50, 50, 50, 50),
            insetPadding: EdgeInsets.all(100),
            title: Text('Lỗi đăng nhập'),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 50,
              // fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            content: Text(content),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
          );

          showDialog(
            context: context,
            builder: (context) {
              return alertDialog;
            },
          );
        }

        if (state is LoginScreenObscureOptionChanged) {
          _obscureOption = state.obscureOption;
          _obscureOptionText = _obscureOption ? 'Hiện' : 'Ẩn';
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_screen_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
