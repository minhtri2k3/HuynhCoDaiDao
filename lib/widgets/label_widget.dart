import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';
import 'package:huynhcodaidaover2/models/label.dart';

class LabelWidget extends StatefulWidget {
  final String labelUrl;

  const LabelWidget({
    Key? key,
    required this.labelUrl,
  }) : super(key: key);

  @override
  _LabelWidgetState createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  final Box _appData = Hive.box('appData');

  late Future<Response> _responseFuture;

  @override
  void initState() {
    _responseFuture = Dio().get(
      widget.labelUrl,
      options: Options(
        headers: {
          'Authorization':
              'Bearer ' + (_appData.get('userToken') as UserToken).accessToken,
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _responseFuture,
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (!snapshot.hasData ||
            snapshot.connectionState != ConnectionState.done) {
          return Container();
        }

        Response? response = snapshot.data;
        Label label = Label.fromJson(response?.data);

        return Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Center(
            child: Text(
              label.data.toString(),
              style: GoogleFonts.robotoSlab(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}
