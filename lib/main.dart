import 'package:flutter/material.dart';
import 'package:flutter_realworld/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
