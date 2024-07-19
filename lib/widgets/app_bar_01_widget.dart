import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huynhcodaidaover2/ui_components/linear_gradients.dart';
import 'package:huynhcodaidaover2/widgets/app_bar_widget.dart';

class AppBar01Widget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBar01Widget({
     Key? key,
    required this.height,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      key: ValueKey('AppBar01Widget'),
      padding:EdgeInsets.all(1),
      height: height,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'HUỲNH CƠ ĐẠI ĐẠO TAM KỲ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
