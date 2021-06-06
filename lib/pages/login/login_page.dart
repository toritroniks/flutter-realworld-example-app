import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_realworld/responsive.dart';

class LoginPage extends StatelessWidget {
  LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                color: Color(0xFF373A3C),
                fontSize: 38,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.hovered)
                      ? Colors.green.shade800
                      : Theme.of(context).primaryColor,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                textStyle: MaterialStateProperty.resolveWith(
                  (states) => states.contains(MaterialState.hovered)
                      ? TextStyle(decoration: TextDecoration.underline)
                      : TextStyle(),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Need an account?',
              ),
            ),
            AutofillGroup(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = Responsive.isMobile(context)
                      ? constraints.maxWidth
                      : constraints.maxWidth * 0.35;
                  return Container(
                    width: width,
                    child: Column(
                      children: [
                        TextField(
                          autofillHints: [AutofillHints.username],
                          decoration: InputDecoration(hintText: 'Email'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
