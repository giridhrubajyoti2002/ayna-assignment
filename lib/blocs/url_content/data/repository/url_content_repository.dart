import 'dart:io';

import 'package:ayna/blocs/url_content/data/data_provider/random_url_data_provider.dart';
import 'package:ayna/blocs/url_content/data/data_provider/url_content_data_provider.dart';
import 'package:ayna/models/file_details.dart';
import 'package:path_provider/path_provider.dart';

class UrlContentRepository {
  final RandomUrlDataProvider _randomUrlDataProvider;
  final UrlContentDataProvider _urlContentDataProvider;

  UrlContentRepository(
      this._randomUrlDataProvider, this._urlContentDataProvider);

  Future<FileDetails> getUrlContent() async {
    try {
      final Map<String, dynamic> data =
          await _randomUrlDataProvider.getRandomUrl();

      final String url = data['url'];
      // const url = "https://random.dog/c6f5f13e-1c2c-4779-991e-ccaf46441454.gif";

      final res = await _urlContentDataProvider.getUrlContentData(url);

      final filepath = await cacheFile(url.split('/').last, res.data ?? []);

      return FileDetails(
        contentType: res.headers.map['content-type']?[0] ?? "",
        localPath: filepath,
        time: DateTime.now(),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> cacheFile(String filename, List<int> content) async {
    final cacheDirPath = (await getTemporaryDirectory()).path;
    File file = await File("$cacheDirPath/$filename").create(recursive: true);
    await file.writeAsBytes(content);
    return file.path;
  }
}
