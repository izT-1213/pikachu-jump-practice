import 'package:flutter/material.dart';

class PikachuAnimationControl extends StatefulWidget {
  const PikachuAnimationControl({Key? key}) : super(key: key);

  @override
  State<PikachuAnimationControl> createState() => _PikachuAnimationControlState();
}

class _PikachuAnimationControlState extends State<PikachuAnimationControl> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _pikachuAnimation;

  @override
  void initState(){
    super.initState();

    _animationController =

        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _pikachuAnimation =
        Tween<Offset>(begin: const Offset(0.0,0.0), end: const Offset(0.0, 2.0)).animate(
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
      child: Image.asset('assets/stay.png', scale: 8),
      builder: (_, Widget? child) =>
      SlideTransition(position: _pikachuAnimation, child: child,)

            );
  }
}
