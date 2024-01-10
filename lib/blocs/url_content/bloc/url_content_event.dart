part of 'url_content_bloc.dart';

@immutable
sealed class UrlContentEvent {}

final class UrlContentFetched extends UrlContentEvent {}
