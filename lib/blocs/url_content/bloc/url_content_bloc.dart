import 'package:ayna/blocs/url_content/data/repository/url_content_repository.dart';
import 'package:ayna/models/file_details.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'url_content_event.dart';
part 'url_content_state.dart';

class UrlContentBloc extends Bloc<UrlContentEvent, UrlContentState> {
  final UrlContentRepository _UrlContentRepository;
  UrlContentBloc(this._UrlContentRepository) : super(UrlContentInitial()) {
    on<UrlContentFetched>(_onUrlContentFetched);
  }

  void _onUrlContentFetched(
      UrlContentFetched event, Emitter<UrlContentState> emit) async {
    emit(UrlContentLoading());
    try {
      final UrlContent = await _UrlContentRepository.getUrlContent();
      emit(UrlContentSuccess(UrlContent));
    } catch (e) {
      emit(UrlContentFailure(e.toString()));
    }
  }
}
