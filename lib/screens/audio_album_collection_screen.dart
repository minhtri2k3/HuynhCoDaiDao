import 'package:flutter/material.dart';
import 'package:huynhcodaidaover2/screens/base_screen.dart';
import 'package:huynhcodaidaover2/widgets/audio_album_collection_widget.dart';

class AudioAlbumCollectionScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;
  final Key? key;

  const AudioAlbumCollectionScreen({
    required this.actionTitle,
    required this.actionUrl,
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      key: ValueKey('AudioAlbumCollectionScreen'),
      title: actionTitle,
      body: AudioAlbumCollectionWidget(
        key: ValueKey('AudioAlbumCollectionWidget'),
        actionUrl: actionUrl,
      ),
    );
  }
}
