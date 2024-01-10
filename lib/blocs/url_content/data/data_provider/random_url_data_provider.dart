import 'package:dio/dio.dart';

class RandomUrlDataProvider {
  Future<dynamic> getRandomUrl() async {
    try {
      final res = await Dio().get('https://random.dog/woof.json');
      if (res.statusCode != 200) {
        throw 'Something wrong happened!!!';
      }
      return res.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
