import 'package:flutter/material.dart';

class AnimeSquareWidget extends StatefulWidget {
  const AnimeSquareWidget({Key? key}) : super(key: key);

  @override
  _AnimeSquareWidgetState createState() => _AnimeSquareWidgetState();
}

class _AnimeSquareWidgetState extends State<AnimeSquareWidget> {
  bool grow = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              setState(() {
                grow = !grow;
              });
            },
            child: AnimatedContainer(
              curve: Curves.elasticOut,
              duration: const Duration(seconds: 2),
              height: grow ? 200 : 100,
              width: grow ? 200 : 100,
              color: Colors.red,
            )));
  }
}

class AnimatedCrossfadeWidget extends StatefulWidget {
  const AnimatedCrossfadeWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCrossfadeWidgetState createState() =>
      _AnimatedCrossfadeWidgetState();
}

class _AnimatedCrossfadeWidgetState extends State<AnimatedCrossfadeWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedCrossFade(
            firstCurve: Curves.bounceOut,
            firstChild: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                    },
                    child: const Text('ENTRAR'))),
            secondChild: const CircularProgressIndicator(),
            crossFadeState: isLoading
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(seconds: 2)));
  }
}

class AnimeSquareControledWidged extends StatefulWidget {
  const AnimeSquareControledWidged({Key? key}) : super(key: key);

  @override
  _AnimeSquareControledWidgedState createState() =>
      _AnimeSquareControledWidgedState();
}

class _AnimeSquareControledWidgedState extends State<AnimeSquareControledWidged>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> squareSize;

  @override
  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    squareSize =
        Tween<double>(begin: 100.00, end: 400.00).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              squareSize.value == 100.00
                  ? animationController.forward()
                  : animationController.reverse();
            },
            child: AnimatedBuilder(
                animation: squareSize,
                builder: (context, _) {
                  return Container(
                      width: squareSize.value,
                      height: squareSize.value,
                      color: Color.lerp(Colors.purple, Colors.pink,
                          animationController.value));
                })));
  }
}
