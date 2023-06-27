import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    super.key,
    required this.androidBuilder,
    required this.iosBuilder,
});
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(context) {
    assert(
      defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS, 'Unexpected platform $defaultTargetPlatform'
    );
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => androidBuilder(context),
      TargetPlatform.iOS => iosBuilder(context),
      _ => const SizedBox.shrink()
    };
  }
}

class HeroAnimatingCard extends StatelessWidget {
  const HeroAnimatingCard({
    required this.item,
    required this.color,
    required this.heroAnimation;
    this.onPressed,
    super.key,
  });

  final String item;
  final Color color;
  final Animation<double> heroAnimation;
  final VoidCallback? onPressed;

  double get displayButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(context) {
    return AnimatedBuilder(
        animation: heroAnimation,
        builder: (context, child) {
          return PressableCard(
            onPressed: heroAnimation.value == 0 ? onPressed : null,
          );
        });
  }
}

class PressableCard extends StatefulWidget {
  const PressableCard({
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  State<StatefulWidget> createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  late final AnimationController controller;
  late final Animation<double> elevationAnimation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 40),);
    elevationAnimation = controller.drive(CurveTween(curve: Curves.easeInOutCirc));
    super.initState();
  }

  @override
  Widget build(context){
    return Listener(
      onPointerDown: (details) {
        if(widget.onPressed != null) {
          controller.forward();
        }
      },
    );
  }

}