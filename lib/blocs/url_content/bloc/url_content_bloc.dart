import 'package:ayna/blocs/url_content/data/repository/url_content_repository.dart';
import 'package:ayna/models/file_details.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'url_content_event.dart';
part 'url_content_state.dart';

class UrlContentBloc extends Bloc<UrlContentEvent, UrlContentState> {
  final UrlContentRepository _urlContentRepository;
  UrlContentBloc(this._urlContentRepository) : super(UrlContentInitial()) {
    on<UrlContentFetched>(_onUrlContentFetched);
  }

  void _onUrlContentFetched(
      UrlContentFetched event, Emitter<UrlContentState> emit) async {
    emit(UrlContentLoading());
    try {
      final urlContent = await _urlContentRepository.getUrlContent();
      emit(UrlContentSuccess(urlContent));
    } catch (e) {
      emit(UrlContentFailure(e.toString()));
    }
  }
}
