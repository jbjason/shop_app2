import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';

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
        actions: [
          const Icon(Icons.search),
          const SizedBox(width: 12),
          DropdownButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            items: [
              DropdownMenuItem(
                child: SizedBox(
                    child: Row(
                  children: const [
                    Icon(Icons.exit_to_app_sharp),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                )),
                value: 'Logout',
              )
            ],
            onTap: () {
              FirebaseAuth.instance.signOut();
              Provider.of<Category>(context, listen: false).setUserId('');
            },
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
