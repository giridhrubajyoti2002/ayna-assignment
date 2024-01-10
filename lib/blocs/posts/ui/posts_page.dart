import 'package:ayna/blocs/posts/bloc/posts_bloc.dart';
import 'package:ayna/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PostsBloc>().add(PostsFetched());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const CircularProgressIndicator();
            }
            if (state is! PostsSuccess) {
              String text = "Something wrong Happened!!!";
              if (state is PostsFailure) {
                text = state.error;
              }
              return Text(text);
            }
            List<Post> posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final Post post = posts[index];
                return ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(post.body),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
