import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatelessWidget {
  final double height;

  const LoadingWidget({
     Key? key,
    required this.height,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      child: Stack(
        children: <Widget>[
          Container(
            height: height,
            child: LinearProgressIndicator(
              backgroundColor: Colors.amberAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
            ),
          ),
          Container(
            height: height,
            child: Center(
              child: Text(
                'Đang tải dữ liệu...',
                style: GoogleFonts.robotoSlab(
                  color: Colors.white,
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
