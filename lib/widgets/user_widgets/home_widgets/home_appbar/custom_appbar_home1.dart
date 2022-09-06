import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/users_screen/sort_by_screen.dart';

class CustomAppBarHome1 extends StatelessWidget {
  const CustomAppBarHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu, size: 30, color: Colors.white),
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(SortByScreen.routeName),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                padding: const EdgeInsets.only(
                    left: 5, right: 10, top: 7, bottom: 7),
                width: 160,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      const BoxShadow(
                          color: AppColors.secondary,
                          spreadRadius: 1,
                          blurRadius: 20),
                      BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 15)
                    ]),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.7)),
                      child: const Center(
                        child:
                            Icon(Icons.search_sharp, color: AppColors.accent),
                      ),
                    ),
                    const Text(
                      'Search Product',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.accent,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
