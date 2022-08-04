import 'package:flutter/material.dart';

class StoneAnimationControl extends StatefulWidget {
  const StoneAnimationControl({Key? key}) : super(key: key);

  @override
  State<StoneAnimationControl> createState() => _StoneAnimationControlState();
}

class _StoneAnimationControlState extends State<StoneAnimationControl>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _rockAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _rockAnimation =
        Tween<Offset>(begin: const Offset(-0.5,0.0), end: const Offset(0.5, 0.0)).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.linear));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Image.asset('assets/stone.png', scale: 2.5),
      builder: (_, Widget? child) =>
          SlideTransition(position: _rockAnimation, child: child),
    );
  }
}
