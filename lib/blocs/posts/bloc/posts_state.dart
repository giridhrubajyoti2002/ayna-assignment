part of 'posts_bloc.dart';

@immutable
sealed class PostsState extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

final class PostsInitial extends PostsState {
  @override
  List<Object?> get props => [runtimeType];
}

final class PostsSuccess extends PostsState {
  final List<Post> posts;

  PostsSuccess({required this.posts});

  @override
  List<Object?> get props => [runtimeType];
}

final class PostsFailure extends PostsState {
  final String error;

  PostsFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class PostsLoading extends PostsState {
  @override
  List<Object?> get props => [runtimeType];
}
