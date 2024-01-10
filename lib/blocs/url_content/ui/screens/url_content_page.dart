import 'dart:io';

import 'package:ayna/blocs/url_content/bloc/url_content_bloc.dart';
import 'package:ayna/blocs/url_content/ui/widgets/gif_view.dart';
import 'package:ayna/blocs/url_content/ui/widgets/image_view.dart';
import 'package:ayna/blocs/url_content/ui/widgets/video_player_view.dart';
import 'package:ayna/hive_boxes.dart';
import 'package:ayna/models/file_details.dart';
import 'package:ayna/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

class UrlContentPage extends StatelessWidget {
  const UrlContentPage({super.key});

  Future<void> saveFile(FileDetails fileDetails) async {
    File file = File(fileDetails.localPath);
    if (file.existsSync()) {
      boxFileDetails.add(fileDetails);
      final supportDirPath = (await getApplicationSupportDirectory()).path;
      file.copySync("$supportDirPath/${fileDetails.localPath.split("/").last}");
      (await getTemporaryDirectory()).deleteSync(recursive: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final urlContentBloc = context.read<UrlContentBloc>();
    urlContentBloc.add(UrlContentFetched());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Content"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<UrlContentBloc, UrlContentState>(
          builder: (context, state) {
            if (state is UrlContentLoading) {
              return const CircularProgressIndicator();
            }
            if (state is! UrlContentSuccess) {
              String text = "Something wrong Happened!!!";
              if (state is UrlContentFailure) {
                text = state.error;
              }
              return Text(text);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(state.fileDetails.localPath),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: SizedBox(
                    height: size.height * 0.45,
                    child: state.fileDetails.contentType.contains("gif")
                        ? GIFView(filepath: state.fileDetails.localPath)
                        : state.fileDetails.contentType.contains("video")
                            ? VideoPlayerView(
                                filepath: state.fileDetails.localPath)
                            : ImageView(filepath: state.fileDetails.localPath),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    saveFile(state.fileDetails);
                    context.goNamed(Routes.POSTS);
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
