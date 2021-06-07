import 'package:flutter/material.dart';
import 'package:flutter_realworld/responsive.dart';
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
    return Responsive(
      desktop: _CustomBaseContent(banner: banner, child: child),
      mobile: _ScaledContent(
        child: _CustomBaseContent(banner: banner, child: child),
      ),
    );
  }
}

class _CustomBaseContent extends StatelessWidget {
  const _CustomBaseContent({
    required this.banner,
    required this.child,
  });

  final Widget? banner;
  final Widget child;

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

class _ScaledContent extends StatelessWidget {
  const _ScaledContent({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final logicWidth = 1000.0;
        final logicHeight =
            logicWidth * (constraints.maxHeight / constraints.maxWidth);
        return SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: logicWidth,
              height: logicHeight,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
