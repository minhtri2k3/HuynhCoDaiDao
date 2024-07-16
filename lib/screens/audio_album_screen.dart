import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';

import 'package:huynhcodaidaover2/widgets/audio_album_widget.dart';

class AudioAlbumScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const AudioAlbumScreen({

    required this.actionTitle,
    required this.actionUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      key: ValueKey('AudioAlbumScreen'),
      title: actionTitle,
      body: AudioAlbumWidget(
        key: ValueKey('AudioAlbumScreen'),
        actionUrl: actionUrl,
      ),
    );
  }
}
