import 'package:flutter/material.dart';

class BasicAppBarHome extends StatelessWidget {
  const BasicAppBarHome({Key? key, required this.shrink}) : super(key: key);
  final double shrink;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: shrink,
      child: AppBar(
        leading: const Icon(Icons.menu_open),
        title: const Text('Hello Shop!', style: TextStyle(fontSize: 20)),
        backgroundColor: const Color.fromARGB(255, 23, 23, 48),
        elevation: 10,
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 12),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}