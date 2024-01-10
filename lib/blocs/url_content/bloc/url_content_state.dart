part of 'url_content_bloc.dart';

@immutable
sealed class UrlContentState extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

final class UrlContentInitial extends UrlContentState {
  @override
  List<Object?> get props => [runtimeType];
}

final class UrlContentLoading extends UrlContentState {
  @override
  List<Object?> get props => [runtimeType];
}

final class UrlContentSuccess extends UrlContentState {
  final FileDetails fileDetails;

  UrlContentSuccess(this.fileDetails);

  @override
  List<Object?> get props => [runtimeType];
}

final class UrlContentFailure extends UrlContentState {
  final String error;

  UrlContentFailure(this.error);

  @override
  List<Object?> get props => [error];
}
