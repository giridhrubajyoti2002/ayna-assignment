part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

final class PostsFetched extends PostsEvent {}
