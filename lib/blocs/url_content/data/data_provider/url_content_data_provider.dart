import 'dart:async';
import 'package:dio/dio.dart';

class UrlContentDataProvider {
  Future<Response> getUrlContentData(String url) async {
    try {
      final res = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      if (res.statusCode != 200) {
        throw 'Something wrong happened!!!';
      }

      return res;
    } catch (e) {
      throw e.toString();
    }
  }
}
