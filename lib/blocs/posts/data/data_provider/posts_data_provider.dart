import 'package:dio/dio.dart';

class PostsDataProvider {
  Future<dynamic> getPostsData() async {
    try {
      final res = await Dio().get('http://jsonplaceholder.typicode.com/posts');
      if (res.statusCode != 200) {
        throw 'Something wrong happened!!!';
      }
      return res.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
