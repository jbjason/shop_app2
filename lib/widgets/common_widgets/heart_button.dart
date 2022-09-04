import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class HeartButton extends StatefulWidget {
  const HeartButton({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double?> _sizeAnimation;
  late Animation<double> curve;
  bool _isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);
    _colorAnimation =
        ColorTween(begin: Colors.grey[850], end: Colors.red).animate(curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 24, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 24), weight: 50)
    ]).animate(curve);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _isFav = true);
      }
      if (status == AnimationStatus.dismissed) {
        setState(() => _isFav = false);
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return GestureDetector(
          onTap: () {
            _isFav ? _controller.reverse() : _controller.forward();
            widget.product.toggleFavoriteStatus();
          },
          child: buttonBackGround(Icon(Icons.favorite,
              color: _colorAnimation.value, size: _sizeAnimation.value)),
        );
      },
    );
  }
}
