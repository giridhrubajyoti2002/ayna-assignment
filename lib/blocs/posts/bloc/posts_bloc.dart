// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ayna/blocs/posts/data/repository/posts_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:ayna/models/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;
  PostsBloc(
    this._postsRepository,
  ) : super(PostsInitial()) {
    on<PostsFetched>(_onPostsFetched);
  }

  void _onPostsFetched(PostsFetched event, Emitter<PostsState> emit) async {
    try {
      emit(PostsLoading());
      List<Post> posts = await _postsRepository.getPostsData();
      emit(PostsSuccess(posts: posts));
    } catch (e) {
      emit(PostsFailure(e.toString()));
    }
  }
}
