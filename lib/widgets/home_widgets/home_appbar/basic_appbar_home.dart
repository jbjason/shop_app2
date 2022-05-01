import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicAppBarHome extends StatelessWidget {
  const BasicAppBarHome({Key? key, required this.shrink}) : super(key: key);
  final double shrink;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: shrink,
      child: AppBar(
        // drawer open button
        leading: InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const Icon(Icons.menu_open)),
        title: Text('Hello Bazar!',
            style: GoogleFonts.permanentMarker(
                textStyle: const TextStyle(fontSize: 20))),
        backgroundColor: const Color.fromARGB(255, 1, 1, 17),
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
