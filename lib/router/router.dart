import 'package:auto_route/annotations.dart';
import 'package:flutter_realworld/pages/article/article_page.dart';
import 'package:flutter_realworld/pages/login/login_page.dart';
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
    CustomRoute(path: mainPath, page: LoginPage, initial: true),
    // CustomRoute(path: loginPath, page: LoginPage),
    CustomRoute(path: loginPath, page: MainPage),
    CustomRoute(path: articlePath, page: ArticlePage),
  ],
)
class $AppRouter {}
