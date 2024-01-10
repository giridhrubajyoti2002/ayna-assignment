import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String filepath;
  const ImageView({super.key, required this.filepath});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(filepath),
    );
  }
}
