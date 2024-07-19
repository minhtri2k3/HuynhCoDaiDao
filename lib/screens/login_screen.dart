import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_screen_bloc.dart';
import '../blocs/login_screen_event.dart';
import '../blocs/login_screen_state.dart';
import '../widgets/alert_dialog_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginScreenBloc, LoginScreenState>(
        listener: (context, state) => _loginListener(context, state),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_screen_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 200, left: 16, right: 16),
              child: Column(
                children: [
                  _phoneTextField,
                  SizedBox(height: 16),
                  _passwordTextField,
                  SizedBox(height: 16),
                  _loginButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginListener(
    BuildContext context,
    LoginScreenState state,
  ) {
    if (state is LoginScreenFailure) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialogWidget(
            title: 'Lỗi đăng nhập',
            content: 'Vui lòng kiểm tra số điện thoại hoặc mật khẩu.',
          );
        },
      );
    }
  }

  Widget get _phoneTextField {
    return TextFormField(
      controller: _usernameController,
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      obscureText: false,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Số điện thoại',
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color(0xd8c3b2b2),
        //  floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget get _passwordTextField {
    return TextFormField(
      controller: _passwordController,
      cursorColor: Colors.white,
      obscureText: true,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Mật khẩu',
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color(0xd8c3b2b2),
        //  floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget get _loginButton {
    return SizedBox(
      width: double.infinity,
      height: 54,
      // This will make the button take the full width of its parent
      child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
        builder: (context, state) {
          if (state is LoginScreenInProgress) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          return ElevatedButton(
            onPressed: () {
              final bloc = context.read<LoginScreenBloc>();
              bloc.add(
                LoginScreenLoginButtonPressed(
                  username: _usernameController.text,
                  password: _passwordController.text,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.orange, // Set the background color to orange
            ),
            child: const Text(
              'Đăng nhập',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
