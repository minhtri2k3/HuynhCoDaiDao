import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class RouterService {
  static void navigateTo({
    required BuildContext context,
    required String actionUrl,
    required String actionTypeName,
    required String actionTitle,
  }) async {
    if (actionUrl == null) {
      return;
    }

    final Uri uri = Uri(
      path: '/' + actionTypeName + '/',
      queryParameters: {
        'actionUrl': base64Url.encode(utf8.encode(actionUrl)),
        'actionTitle': base64Url.encode(utf8.encode(actionTitle)),
      },
    );

    await Navigator.pushNamed(context, uri.toString());
  }
}
