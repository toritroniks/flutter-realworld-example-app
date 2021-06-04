import 'package:flutter/material.dart';
import 'package:flutter_realworld/pages/main/widgets/article_area.dart';
import 'package:flutter_realworld/pages/main/widgets/main_banner.dart';
import 'package:flutter_realworld/pages/main/widgets/tags_box.dart';
import 'package:flutter_realworld/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainBanner(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 80,
                    child: ArticleArea(),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 20,
                    child: TagsBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
