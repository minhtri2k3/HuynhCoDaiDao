import 'package:flutter/material.dart';

import 'package:huynhcodaidaover2/screens/base_screen.dart';
import 'package:pdfx/pdfx.dart';



class PdfViewScreen extends StatelessWidget {
  final String actionTitle;
  final String actionUrl;

  const PdfViewScreen({

    required this.actionTitle,
    required this.actionUrl,
  });

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/test.pdf'),
    );
    return BaseScreen(
      title: actionTitle,
      body: PdfView(
        controller: pdfController,
      ),
    );
  }
}
