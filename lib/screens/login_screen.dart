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
      listener: ( context, state) {
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
               fontSize: 50.sp,
              // fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
            content: Text(content),
            contentTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 50.sp,
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
          // ignore: close_sinks
          final LoginScreenBloc loginScreenBloc =
          BlocProvider.of<LoginScreenBloc>(context);
              return Stack(
                children: <Widget>[
                  Scaffold(
                    body: Theme(
                      data: ThemeData(
                        brightness: Brightness.dark,
                        primaryColor: _textFormFieldColor,
                        hintColor: _textFormFieldColor,
                        cardColor: _textFormFieldColor,
                        textTheme: TextTheme(
                          labelLarge: TextStyle(
                              fontSize: 50.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            fontSize: 50.sp,
                          ),
                          contentPadding: EdgeInsets.all(50),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9999),
                            borderSide: BorderSide(
                              width: 4.w,
                              color: _textFormFieldColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9999),
                            borderSide: BorderSide(
                              width: 8.w,
                              color: _textFormFieldColor,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9999),
                            borderSide: BorderSide(
                              width: 4.w,
                              color: _textFormFieldColor,
                            ),
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          // width: constraints.maxWidth,
                          // height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/login_screen_background.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                // width: constraints.maxWidth * 0.5,
                                margin: EdgeInsets.all(200),
                                child: Image(
                                  image: AssetImage('assets/logo.png'),
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amberAccent,
                                      blurRadius: 80.w,
                                      spreadRadius: 80.w,

                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(120, 20, 120, 20),
                                child: TextFormField(
                                  enabled: state is! LoginScreenInProgress,
                                  controller: _usernameController,
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                    fontSize: 50.sp,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Số điện thoại',
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      size: 80.sp,
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                       minWidth: 200.w,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(120, 20, 120, 20),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    TextFormField(
                                      enabled: state is! LoginScreenInProgress,
                                      controller: _passwordController,
                                      obscureText: _obscureOption,
                                      style: TextStyle(
                                        fontSize: 50.sp,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Mật khẩu',
                                        prefixIcon: Icon(
                                          Icons.vpn_key,
                                           size: 80.sp,
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                           minWidth: 200.w,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                       right: 50.w,
                                      child: GestureDetector(
                                        child: Text(
                                          _obscureOptionText,
                                          style: TextStyle(
                                            color: _textFormFieldColor,
                                            fontSize: 50.sp,
                                            fontStyle: FontStyle.italic,
                                            decoration: TextDecoration.underline,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onTap: state is LoginScreenInProgress
                                            ? null
                                            : () {
                                          loginScreenBloc.add(
                                            LoginScreenObscureOptionTapped(
                                              obscureOption: _obscureOption,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(120, 60, 120, 60),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amberAccent, // background color
                                    disabledForegroundColor: Colors.amberAccent.withOpacity(0.38),
                                    disabledBackgroundColor: Colors.amberAccent.withOpacity(0.12), // disabled background color
                                    padding: EdgeInsets.fromLTRB(120, 60, 120, 60),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9999),
                                      side: BorderSide(color: Colors.amber),
                                    ),
                                  ),
                                  onPressed: state is LoginScreenInProgress
                                      ? null
                                      : () {
                                    loginScreenBloc.add(
                                      LoginScreenLoginButtonPressed(
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'ĐĂNG NHẬP',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )

                  ,state is LoginScreenInProgress
                      ? Container(
                    color: Colors.black54,
                    child: Center(
                      child: SpinKitFadingCircle(
                        size: 120.w,
                        color: Colors.amber,
                      ),
                    ),
                  )
                      : Container(),
                ],
              );

        },

    );
  }
}
