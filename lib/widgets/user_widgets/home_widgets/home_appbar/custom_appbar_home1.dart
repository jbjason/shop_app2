import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/screens/users_screen/offers_screen.dart';

class CustomAppBarHome1 extends StatelessWidget {
  const CustomAppBarHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _topButtons(context),
        _seeTextButton(context),
      ],
    );
  }

  Widget _topButtons(BuildContext context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 4,
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
            onChanged: (val) {
              if (val == 'Lougout') {
                Provider.of<Category>(context, listen: false).logOut();
              }
            },
          ),
        ],
      ));

  Widget _seeTextButton(BuildContext context) => Positioned(
        bottom: 10,
        right: 30,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(OffersScreen.routeName),
          child: const Text(
            'See All',
            style:
                TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
