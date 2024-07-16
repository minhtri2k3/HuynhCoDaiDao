import 'package:hive/hive.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:huynhcodaidaover2/models/user_token.dart';

class NetworkImageWidget extends StatefulWidget {
  final String source;
  final Map<String, String> headers;
  final double width;
  final double height;
  final BoxFit fit;

  const NetworkImageWidget({
    required Key key,
    required this.source,
    required this.headers,
    required this.width,
    required this.height,
    required this.fit,
  }) : super(key: key);

  @override
  _NetworkImageWidgetState createState() => _NetworkImageWidgetState();
}

class _NetworkImageWidgetState extends State<NetworkImageWidget> {
  final Box _appData = Hive.box('appData');

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.source,
      httpHeaders: widget.headers != null
          ? widget.headers
          : {
              'Authorization': 'Bearer ' +
                  (_appData.get('userToken') as UserToken).accessToken,
            },
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      fadeOutDuration: Duration(milliseconds: 500),
      placeholder: (BuildContext context, String url) {
        return Container(
          width: widget.width,
          height: widget.height,
          child: Center(
            child: SpinKitFadingCircle(
              size: 120,
              color: Colors.amber,
            ),
          ),
        );
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return Container(
          width: widget.width,
          height: widget.height,
        );
      },
    );
  }
}
