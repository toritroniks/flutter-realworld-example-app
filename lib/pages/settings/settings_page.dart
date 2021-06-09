import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_realworld/errors/api_validation_error.dart';
import 'package:flutter_realworld/providers/login_provider.dart';
import 'package:flutter_realworld/responsive.dart';
import 'package:flutter_realworld/router/router.gr.dart';
import 'package:flutter_realworld/widgets/custom_base.dart';
import 'package:flutter_realworld/widgets/custom_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> errors = [];
  String username = '';
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
                Text(
                  'Your Settings',
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
                    context.router.push(LoginRoute());
                  },
                  child: Text(
                    'Have an account?',
                  ),
                ),
                SizedBox(height: 10),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = Responsive.isMobile(context)
                        ? constraints.maxWidth
                        : constraints.maxWidth * 0.4;
                    return Container(
                      width: width,
                      child: Column(
                        children: [
                          CustomForm(
                            errors: errors,
                            submitText: 'Update Settings',
                            onSubmit: () {},
                            children: [
                              CustomTextField(
                                hintText: 'Username',
                                // autofillHints: [AutofillHints.username], // TODO: uncomment when autofill bug fix gets to flutter stable
                                onChanged: (val) {
                                  username = val;
                                },
                              ),
                              CustomTextField(
                                hintText: 'Email',
                                // autofillHints: [AutofillHints.email], // TODO: uncomment when autofill bug fix gets to flutter stable
                                onChanged: (val) {
                                  email = val;
                                },
                              ),
                              CustomTextField(
                                hintText: 'Password',
                                // autofillHints: [AutofillHints.password], // TODO: uncomment when autofill bug fix gets to flutter stable
                                onChanged: (val) {
                                  password = val;
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                            height: 40,
                            thickness: 1,
                          ),
                          _LogoutButton(),
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

  Future<void> _signUp() async {
    try {
      await context.read(loginProvider).signUp(
            context,
            username: username,
            email: email,
            password: password,
          );
    } on ApiValidationError catch (err) {
      errors = err.errors;
      setState(() {});
      return;
    }
    await context.router.pushAndPopUntil(
      MainRoute(),
      predicate: (route) => false,
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFB85C5C);
    return Row(
      children: [
        TextButton(
          onPressed: () {
            _logout(context);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.hovered) ? Colors.white : color),
            backgroundColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.hovered) ? color : Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: color, width: 1.3),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Or click here to logout.'),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Future<void> _logout(BuildContext context) async {
    await context.read(loginProvider).logout();
    await context.router.push(MainRoute());
  }
}
