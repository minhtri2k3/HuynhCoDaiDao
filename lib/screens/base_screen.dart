import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:huynhcodaidaover2/blocs/audio_controller_state.dart';
import 'package:huynhcodaidaover2/blocs/audio_controller_bloc.dart';

import 'package:huynhcodaidaover2/ui_components/linear_gradients.dart';

import 'package:huynhcodaidaover2/widgets/app_bar_02_widget.dart';
class BaseScreen extends StatelessWidget {
  final String title;
  final Widget body;
  const BaseScreen({
    required Key key,
    required this.title,
    required this.body,
  })  : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradients.main,
      ),
      child: SafeArea(
        child: BlocBuilder<AudioControllerBloc, AudioControllerState>(
          builder: (BuildContext context, AudioControllerState state) {
            double audioControllerHeight = 180;
            if (state is AudioControllerHiding) {
              audioControllerHeight = 0;
            }
            return Scaffold(
              appBar: AppBar02Widget(
                key: ValueKey('AppBar02WidgetKey'),
                height: 160,
                title: title,
                audioControllerHeight: audioControllerHeight,
              ),
              body: body,
            );
          },
        ),
      ),
    );
  }
}
