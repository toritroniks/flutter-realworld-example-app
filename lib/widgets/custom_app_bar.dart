import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realworld/router/router.dart';
import 'package:flutter_realworld/router/router.gr.dart';

class CustomAppBar {
  static PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextButton(
              onPressed: () {
                context.router.push(MainRoute());
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
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.hovered)
                    ? Colors.black87
                    : Colors.black45),
            overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.transparent),
          ),
          onPressed: () {},
          child: Text(
            'Home',
            style: TextStyle(
              color:
                  context.router.current.path == mainPath ? Colors.black : null,
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
            context.router.push(LoginRoute());
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
          onPressed: () {},
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
    );
  }
}
