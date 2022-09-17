import 'dart:math';

import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var carAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = carAspectRatio * 1.2;

class _MyAppState extends State<MyApp> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(
      () {
        setState(() {
          currentPage = controller.page!;
        });
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xff2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 30, bottom: 8.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.align_horizontal_right,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffff6e6e),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text(
                          'Animated',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text(
                    '25+ Stories',
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: images.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: ((context, index) {
                      return Container();
                    }),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthtOfPrimaryCard = heightOfPrimaryCard * carAspectRatio;

        var primaryCardLeft = safeWidth - widthtOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;

          var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0));
        }
      }),
    );
  }
}
