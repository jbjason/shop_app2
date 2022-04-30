import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/offers_screen.dart';
import 'package:shop_app2/widgets/home_widgets/home_appbar/custom_body_home.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome(
      {Key? key, required this.height, required this.disappear})
      : super(key: key);
  final double height, disappear;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disappear,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // border
          _clipper1(),
          // offer image
          _offerImage(context),
          // body
          CustomBodyHome(height: height),
          _image(),
          // menu button
          _topButtons(),
          // clipped area text
          _seeTextButton(context),
        ],
      ),
    );
  }

  Widget _clipper1() => ClipPath(
        clipper: HomeClipper(),
        child: Container(
          height: height,
          color: const Color.fromARGB(255, 103, 103, 180).withOpacity(0.5),
        ),
      );

  Widget _image() => Positioned(
        right: -20,
        top: height * .2,
        child: Container(
          height: height * .7,
          width: 190,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/shopping.png'), fit: BoxFit.contain),
          ),
        ),
      );

  Widget _topButtons() => Positioned(
        top: 40,
        left: 6,
        right: 9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.read_more_sharp, size: 35, color: Colors.white),
            Icon(Icons.more_vert, color: Colors.white)
          ],
        ),
      );

  Widget _offerImage(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: -52,
      right: width * .3,
      child:
          Lottie.asset('assets/offer_.json', height: 170, fit: BoxFit.contain),
    );
  }

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
