import 'package:ayna/blocs/posts/data/data_provider/posts_data_provider.dart';
import 'package:ayna/models/post.dart';

class PostsRepository {
  final PostsDataProvider _postsDataProvider;

  PostsRepository(this._postsDataProvider);
  Future<List<Post>> getPostsData() async {
    try {
      final List<dynamic> postsData = await _postsDataProvider.getPostsData();
      List<Post> posts = [];
      for (Map<String, dynamic> element in postsData) {
        posts.add(Post.fromMap(element));
      }
      return posts;
    } catch (e) {
      throw e.toString();
    }
  }
}
