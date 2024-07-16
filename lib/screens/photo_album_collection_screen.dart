import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/widgets/photo_album_collection_widget.dart';

import '../widgets/photo_album_collection_widget.dart';

class PhotoAlbumCollectionScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const PhotoAlbumCollectionScreen({

     required this.actionTitle,
    required this.actionUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      key : ValueKey('PhotoAlbumCollectionScreen'),
      title: actionTitle,
      body: PhotoAlbumCollectionWidget(

        actionUrl: actionUrl,
      ),
    );
  }
}
