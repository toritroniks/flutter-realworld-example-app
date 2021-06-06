import 'package:flutter/material.dart';
import 'package:flutter_realworld/widgets/custom_app_bar.dart';
import 'package:flutter_realworld/widgets/custom_content_area.dart';

class CustomBase extends StatelessWidget {
  const CustomBase({
    required this.child,
    this.banner,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Widget? banner;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          if (banner != null) banner!,
          CustomContentArea(child: child),
        ],
      ),
    );
  }
}
