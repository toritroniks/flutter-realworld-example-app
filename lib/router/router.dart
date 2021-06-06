import 'package:auto_route/annotations.dart';
import 'package:flutter_realworld/pages/article/article_page.dart';
import 'package:flutter_realworld/pages/login/login_page.dart';
import 'package:flutter_realworld/pages/main/main_page.dart';
import 'package:flutter_realworld/pages/register/register_page.dart';

// one time build：flutter pub run build_runner build
// watch for changes and build real-time：flutter pub run build_runner watch
// snippets: api-req・api-res・api-item

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
    CustomRoute(path: loginPath, page: LoginPage),
    CustomRoute(path: registerPath, page: RegisterPage),
    CustomRoute(path: articlePath, page: ArticlePage),
  ],
)
class $AppRouter {}
