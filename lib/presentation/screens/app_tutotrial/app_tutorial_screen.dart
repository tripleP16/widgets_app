import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Qui aute labore culpa pariatur laborum. Ut exercitation ex sint ullamco id aliqua quis irure incididunt magna labore ipsum fugiat qui. Minim quis ad nostrud est eu duis voluptate dolor adipisicing.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Nulla fugiat quis elit in labore nostrud consectetur aliquip dolor. Ipsum minim aliqua sint sunt veniam sunt mollit commodo voluptate incididunt duis ut exercitation voluptate. Nulla esse in incididunt excepteur aliqua sint elit laborum exercitation voluptate laboris Lorem laboris. Lorem laborum culpa reprehenderit velit do. Aliquip velit nisi deserunt fugiat do ipsum consequat ullamco pariatur aliquip. Dolor labore ipsum irure aute nostrud adipisicing tempor excepteur incididunt. Elit proident voluptate quis aliqua aute eiusmod ut fugiat amet magna ea amet.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Tempor deserunt dolor elit consequat tempor duis. Officia labore dolor excepteur laboris reprehenderit eiusmod Lorem ipsum laboris cupidatat cillum cupidatat. Eiusmod laborum officia laborum fugiat exercitation. Veniam et proident aliquip ex duis officia eiusmod. Tempor ad do irure exercitation cupidatat mollit ad magna non anim proident velit consectetur.',
      imageUrl: 'assets/images/3.png'),
];

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController _controller;
  bool endReached = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      final page = _controller.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const BouncingScrollPhysics(),
            children: slides.map((e) => _Slide(e)).toList(),
          ),
          Positioned(
            top: 50,
            right: 25,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 40,
                  right: 40,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo model;
  const _Slide(this.model);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(model.imageUrl),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              model.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
