import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class GIFView extends StatefulWidget {
  final String filepath;
  const GIFView({
    Key? key,
    required this.filepath,
  }) : super(key: key);

  @override
  State<GIFView> createState() => _GIFViewState();
}

class _GIFViewState extends State<GIFView> {
  late final GifController _controller;
  @override
  void initState() {
    super.initState();
    _controller = GifController(
      autoPlay: true,
      loop: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GifView.memory(
      File(widget.filepath).readAsBytesSync(),
      frameRate: 30, // default is 15 FPS
      controller: _controller,
    );
  }
}
