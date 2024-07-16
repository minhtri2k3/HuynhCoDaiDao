import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BoxDecoration decoration;

  const AppBarWidget({
    required Key key,
    required this.height,
    required this.child,
    required this.padding,
    required this.decoration,
  })  : assert(height != null),
        assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: child,
      padding: padding,
      decoration: decoration,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
