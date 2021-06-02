import 'package:auto_route/annotations.dart';
import 'package:flutter_realworld/pages/article/article_page.dart';
import 'package:flutter_realworld/pages/main/main_page.dart';

const mainPath = '/';
const profilePath = '/:id';
const loginPath = '/login';
const registerPath = '/rigister';
const settingsPath = '/settings';
const articlePath = '/article/:id';
const editorPath = '/editor';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(path: mainPath, page: MainPage, initial: true),
    CustomRoute(path: articlePath, page: ArticlePage),
  ],
)
class $AppRouter {}
