import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';

class CustomAppBarHome1 extends StatelessWidget {
  const CustomAppBarHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.read_more_sharp, color: Colors.white),
            ),
            DropdownButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              items: [
                DropdownMenuItem(
                    child: SizedBox(
                      child: Row(
                        children: const [
                          Icon(Icons.exit_to_app_sharp),
                          SizedBox(width: 8),
                          Text('Logout')
                        ],
                      ),
                    ),
                    value: 'Logout')
              ],
              onTap: () {
                FirebaseAuth.instance.signOut();
                Provider.of<Category>(context, listen: false).setUserId('');
              },
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
