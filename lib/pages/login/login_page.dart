import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realworld/errors/api_validation_error.dart';
import 'package:flutter_realworld/providers/login_provider.dart';
import 'package:flutter_realworld/responsive.dart';
import 'package:flutter_realworld/router/router.gr.dart';
import 'package:flutter_realworld/widgets/custom_base.dart';
import 'package:flutter_realworld/widgets/custom_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> errors = [];
  String email = '';
  String password = '';

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
                const Text(
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
                          ? const TextStyle(
                              decoration: TextDecoration.underline)
                          : const TextStyle(),
                    ),
                  ),
                  onPressed: () {
                    context.router.push(const RegisterRoute());
                  },
                  child: const Text(
                    'Need an account?',
                  ),
                ),
                const SizedBox(height: 10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = Responsive.isMobile(context)
                        ? constraints.maxWidth
                        : constraints.maxWidth * 0.4;
                    return SizedBox(
                      width: width,
                      child: CustomForm(
                        errors: errors,
                        submitText: 'Sign in',
                        onSubmit: () {
                          _login();
                        },
                        children: [
                          CustomTextField(
                            hintText: 'Email',
                            autofillHints: const [AutofillHints.username],
                            onChanged: (val) {
                              email = val;
                            },
                          ),
                          CustomTextField(
                            hintText: 'Password',
                            obscureText: true,
                            autofillHints: const [AutofillHints.password],
                            onChanged: (val) {
                              password = val;
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      await context.read(loginProvider).login(
            context,
            email: email,
            password: password,
          );
    } on ApiValidationError catch (err) {
      errors = err.errors;
      setState(() {});
      return;
    }
    await context.router.pushAndPopUntil(
      const MainRoute(),
      predicate: (route) => false,
    );
  }
}
