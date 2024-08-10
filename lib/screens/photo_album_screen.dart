import 'package:flutter/material.dart';
import '../widgets/photo_album_widget.dart';

import 'base_screen.dart';

class PhotoAlbumScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const PhotoAlbumScreen({
    required this.actionTitle,
    required this.actionUrl,
  });


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: actionTitle,
      body: PhotoAlbumWidget(
        actionUrl: actionUrl, key: ValueKey('PhotoAlbumScreen'),
      ),
    );
  }
}
