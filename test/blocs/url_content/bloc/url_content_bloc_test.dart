import 'package:ayna/blocs/url_content/bloc/url_content_bloc.dart';
import 'package:ayna/blocs/url_content/data/data_provider/random_url_data_provider.dart';
import 'package:ayna/blocs/url_content/data/data_provider/url_content_data_provider.dart';
import 'package:ayna/blocs/url_content/data/repository/url_content_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'UrlContentBloc',
    () {
      late UrlContentBloc urlContentBloc;

      setUp(() {
        urlContentBloc = UrlContentBloc(
          UrlContentRepository(
            RandomUrlDataProvider(),
            UrlContentDataProvider(),
          ),
        );
      });

      tearDown(() {
        urlContentBloc.close();
      });

      test('Initial state of UrlContentBloc', () {
        expect(urlContentBloc.state, UrlContentInitial());
      });

      blocTest(
        'The UrlContentBloc should emit UrlContentLoading on UrlContentFetched',
        build: () => urlContentBloc,
        act: (bloc) => bloc.add(UrlContentFetched()),
        expect: () => [UrlContentLoading()],
      );

      // blocTest(
      //   'The UrlContentBloc should emit UrlContentLoading and UrlContentSuccess on UrlContentFetched',
      //   build: () => urlContentBloc,
      //   act: (bloc) => bloc.add(UrlContentFetched()),
      //   expect: () => [UrlContentLoading(), isA<UrlContentSuccess>()],
      // );
    },
  );
}
