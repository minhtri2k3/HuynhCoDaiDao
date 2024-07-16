
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huynhcodaidaover2/blocs/audio_controller_state.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_bloc.dart';

import 'package:huynhcodaidaover2/ui_components/linear_gradients.dart';
import 'package:huynhcodaidaover2/widgets/app_bar_widget.dart';

final GetIt getIt = GetIt.instance;

class AppBar02Widget extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final double audioControllerHeight;

  const AppBar02Widget({
    required Key key,
    required this.height,
    required this.title,
    required this.audioControllerHeight,
  });

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
                  child: Center(

                  ),
                ),
              ],
            );
          },
        ),
        AppBarWidget(
          key: ValueKey('AppBar02Widget'),
          padding: EdgeInsets.all(1),
          height: widget.height,
          child: Center(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 80,
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
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home/',
                    (route) => false,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 80,
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
