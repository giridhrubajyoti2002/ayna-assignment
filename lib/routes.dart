import 'package:ayna/blocs/posts/ui/posts_page.dart';
import 'package:ayna/blocs/url_content/ui/screens/url_content_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        name: Routes.RANDOM_CONTENT,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const UrlContentPage();
        },
        routes: [
          GoRoute(
            name: Routes.POSTS,
            path: 'posts',
            builder: (BuildContext context, GoRouterState state) {
              return const PostsPage();
            },
          ),
        ]),
  ],
);

abstract class Routes {
  Routes._();
  static const RANDOM_CONTENT = 'random-content';
  static const POSTS = 'posts';
}
