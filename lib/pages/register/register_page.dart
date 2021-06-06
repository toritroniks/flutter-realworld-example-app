import 'package:flutter/material.dart';
import 'package:flutter_realworld/widgets/custom_base.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomBase(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
