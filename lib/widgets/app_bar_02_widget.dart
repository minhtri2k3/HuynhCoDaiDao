import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../blocs/audio_controller_bloc.dart';
import '../blocs/audio_controller_state.dart';
import '../ui_components/linear_gradients.dart';
import 'app_bar_widget.dart';

final GetIt getIt = GetIt.instance;

class AppBar02Widget extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final double audioControllerHeight;
  const AppBar02Widget({
    Key? key,
    required this.height,
    required this.title,
    required this.audioControllerHeight,
  }) : super(key : key);

  @override
  Size get preferredSize => Size.fromHeight(height + audioControllerHeight);

  @override
  State createState() => _AppBar02WidgetState();
}

class _AppBar02WidgetState extends State<AppBar02Widget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocBuilder<AudioControllerBloc, AudioControllerState>(
          builder: (BuildContext context, AudioControllerState state) {
            if (state is AudioControllerHiding) {
              return Container();
            }

            return Column(
              children: <Widget>[
                SizedBox(
                  height: widget.height,
                ),
                Container(
                  width: 1080,
                  height: widget.audioControllerHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
//                        Color.fromRGBO(208, 246, 255, 1),
//                        Color.fromRGBO(255, 237, 237, 1),
//                        Color.fromRGBO(255, 255, 231, 1),
                        Color.fromRGBO(92, 121, 255, 1),
                        Color.fromRGBO(76, 221, 242, 1),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(),
                ),
              ],
            );
          },
        ),
        AppBarWidget(
          padding: EdgeInsets.all(1),
          height: widget.height,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                      GoRouter.of(context).pop();
                    print('Pressed the pop');
                    // context.go('/home'); // pop out to the '/home' in the router
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.robotoSlab(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/home');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradients.main,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
