import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realworld/responsive.dart';
import 'package:flutter_realworld/router/router.gr.dart';
import 'package:flutter_realworld/widgets/custom_base.dart';

class LoginPage extends StatelessWidget {
  LoginPage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomBase(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Sign in',
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
                  onPressed: () {
                    context.router.push(RegisterRoute());
                  },
                  child: Text(
                    'Need an account?',
                  ),
                ),
                SizedBox(height: 10),
                AutofillGroup(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = Responsive.isMobile(context)
                          ? constraints.maxWidth
                          : constraints.maxWidth * 0.4;
                      return Container(
                        width: width,
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Email',
                              // autofillHints: [AutofillHints.email], // TODO: uncomment when autofill bug fix gets to flutter stable
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              hintText: 'Password',
                              controller: TextEditingController(),
                              // autofillHints: [AutofillHints.password], // TODO: uncomment when autofill bug fix gets to flutter stable
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).primaryColor),
                                      overlayColor:
                                          MaterialStateProperty.resolveWith(
                                        (states) => states
                                                .contains(MaterialState.hovered)
                                            ? Colors.black12
                                            : null,
                                      ),
                                      fixedSize: MaterialStateProperty.all(
                                          Size(100, 50)),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 18))),
                                  child: Text('Sign in'),
                                ),
                              ],
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
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.hintText,
    this.autofillHints,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
      ),
    );
  }
}
