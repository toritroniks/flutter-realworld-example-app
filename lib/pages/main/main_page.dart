import 'package:flutter/material.dart';
import 'package:flutter_realworld/pages/main/widgets/tags_box.dart';
import 'package:flutter_realworld/widgets/custom_app_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(context),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0, 0.03],
                      colors: [Color(0x30000000), Colors.transparent],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 0.03],
                      colors: [Color(0x30000000), Colors.transparent],
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SelectableText(
                          'conduit',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  blurRadius: 1,
                                  color: Colors.black26,
                                  offset: Offset(0, 2)),
                            ],
                          ),
                        ),
                        SelectableText(
                          'A place to share your Flutter knowledge.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 80,
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 20,
                  child: TagsBox(),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
