import 'package:flutter/material.dart';
import 'package:flutter_realworld/providers/login_provider.dart';
import 'package:flutter_realworld/router/router.gr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    context.read(loginProvider).init(context);
    return MaterialApp.router(
      title: 'Flutter Realworld App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        scrollbarTheme: ScrollbarThemeData(
          isAlwaysShown: true,
          thickness: MaterialStateProperty.resolveWith((states) => 10),
          showTrackOnHover: true,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
        primaryColor: Color(0xFF5CB85C),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
