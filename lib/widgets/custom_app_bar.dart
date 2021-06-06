import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realworld/router/router.dart';
import 'package:flutter_realworld/router/router.gr.dart';
import 'package:flutter_realworld/widgets/custom_content_area.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Center(
        child: CustomContentArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    if (context.router.current.path != mainPath) {
                      context.router.push(MainRoute());
                    }
                  },
                  child: Text(
                    'conduit',
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.hovered)
                          ? Colors.black87
                          : Colors.black45),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                ),
                onPressed: () {
                  if (context.router.current.path != mainPath) {
                    context.router.push(MainRoute());
                  }
                },
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: context.router.current.path == mainPath
                        ? Colors.black
                        : null,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.hovered)
                          ? Colors.black87
                          : Colors.black45),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                ),
                onPressed: () {
                  if (context.router.current.path != loginPath) {
                    context.router.push(LoginRoute());
                  }
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: context.router.current.path == loginPath
                        ? Colors.black
                        : null,
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((states) =>
                      states.contains(MaterialState.hovered)
                          ? Colors.black87
                          : Colors.black45),
                  overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent),
                ),
                onPressed: () {
                  if (context.router.current.path != registerPath) {
                    context.router.push(RegisterRoute());
                  }
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: context.router.current.path == registerPath
                        ? Colors.black
                        : null,
                  ),
                ),
              ),
              SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }
}
