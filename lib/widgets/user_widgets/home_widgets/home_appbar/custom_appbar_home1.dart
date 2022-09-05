import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';

class CustomAppBarHome1 extends StatelessWidget {
  const CustomAppBarHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: InkWell(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: const Icon(Icons.read_more_sharp, color: Colors.white)),
      actions: [
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
    );
  }
}
