import 'package:flutter/material.dart';
import '../widgets/photo_album_collection_widget.dart';

import 'base_screen.dart';

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
      title: actionTitle,
      body: PhotoAlbumCollectionWidget(

        actionUrl: actionUrl,
      ),
    );
  }
}
