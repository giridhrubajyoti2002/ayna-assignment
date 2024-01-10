import 'package:ayna/blocs/posts/bloc/posts_bloc.dart';
import 'package:ayna/blocs/posts/data/data_provider/posts_data_provider.dart';
import 'package:ayna/blocs/posts/data/repository/posts_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'PostsBloc',
    () {
      late PostsBloc postsBloc;

      setUp(() {
        postsBloc = PostsBloc(PostsRepository(PostsDataProvider()));
      });

      tearDown(() {
        postsBloc.close();
      });

      test('Initial state of PostBloc', () {
        expect(postsBloc.state, PostsInitial());
      });

      blocTest(
        'The PostsBloc should emit PostsLoading on PostsFetched',
        build: () => postsBloc,
        act: (bloc) => bloc.add(PostsFetched()),
        expect: () => [PostsLoading()],
      );

      // blocTest(
      //   'The PostsBloc should emit PostsSuccess and PostSuccess on PostsFetched',
      //   build: () => postsBloc,
      //   act: (bloc) => bloc.add(PostsFetched()),
      //   expect: () =>   [PostsLoading(), isA<PostsSuccess>()],
      // );
    },
  );
}
