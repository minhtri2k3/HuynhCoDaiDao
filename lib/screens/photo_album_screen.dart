import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/widgets/photo_album_widget.dart';

import '../widgets/photo_album_widget.dart';

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
