import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlareTeddy extends StatefulWidget {
  FlareTeddy({Key? key, required this.animation}) : super(key: key);
  String animation;
  @override
  State<FlareTeddy> createState() => _FlareTeddyState();
}

class _FlareTeddyState extends State<FlareTeddy> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 300,
      child: FlareActor(
        'assets/Teddy.flr',
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
        animation: widget.animation,
        callback: (_) => setState(() => widget.animation = 'idle'),
      ),
    );
  }
}
