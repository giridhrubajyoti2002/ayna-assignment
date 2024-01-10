import 'package:ayna/app_bloc_observer.dart';
import 'package:ayna/blocs/posts/bloc/posts_bloc.dart';
import 'package:ayna/blocs/posts/data/data_provider/posts_data_provider.dart';
import 'package:ayna/blocs/posts/data/repository/posts_repository.dart';
import 'package:ayna/blocs/url_content/bloc/url_content_bloc.dart';
import 'package:ayna/blocs/url_content/data/data_provider/random_url_data_provider.dart';
import 'package:ayna/blocs/url_content/data/data_provider/url_content_data_provider.dart';
import 'package:ayna/blocs/url_content/data/repository/url_content_repository.dart';
import 'package:ayna/hive_boxes.dart';

import 'package:ayna/models/file_details.dart';
import 'package:ayna/routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FileDetailsAdapter());
  boxFileDetails = await Hive.openBox('fileDetailsBox');

  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UrlContentBloc(
            UrlContentRepository(
              RandomUrlDataProvider(),
              UrlContentDataProvider(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => PostsBloc(
            PostsRepository(
              PostsDataProvider(),
            ),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Ayna Assignment',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
