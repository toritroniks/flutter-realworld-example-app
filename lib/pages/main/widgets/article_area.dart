import 'package:flutter/material.dart';
import 'package:flutter_realworld/api/api.dart';
import 'package:flutter_realworld/api/api_models.dart';

class ArticleArea extends StatefulWidget {
  const ArticleArea();

  @override
  _ArticleAreaState createState() => _ArticleAreaState();
}

class _ArticleAreaState extends State<ArticleArea> {
  List<ArticleItem> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    try {
      final res = await Api.articlesGet(
        context,
        ArticlesGetRequest(
          limit: '10',
          offset: '0',
        ),
      );
      articles = res.articles;
    } finally {
      isLoading = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: isLoading
          ? Text('Loading articles...')
          : Column(
              children: articles
                  .map((article) => Container(
                        width: double.infinity,
                        height: 300,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF818A91),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          article.title,
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ))
                  .toList(),
            ),
    );
  }
}
