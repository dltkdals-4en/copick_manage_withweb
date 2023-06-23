import 'package:flutter/material.dart';

import 'colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen( {this.text,Key? key}) : super(key: key);

  final String? text;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  Color? _color = Colors.grey[400];
  late AnimationController _controller;
  late Animation<Color?> animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    animation = ColorTween(
      begin: Colors.grey,
      end: KColors.primary,
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: animation.value),
                    ),
                    Image.asset(
                      'assets/images/loadingLogo.png',
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
                (widget.text !=null)?Text(widget.text!):SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
