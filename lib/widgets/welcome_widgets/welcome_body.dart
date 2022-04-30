import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/widgets/welcome_widgets/welcome_body1.dart';
import 'package:shop_app2/widgets/welcome_widgets/welcome_body2.dart';
import 'package:shop_app2/widgets/welcome_widgets/welcome_bottom_container.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);
  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: PageView.builder(
              itemCount: 3,
              onPageChanged: (index) => setState(() => _isSelected = index),
              itemBuilder: (context, i) => _getChild(i)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: WelcomeBottomContainer(isSelected: _isSelected),
        ),
      ],
    );
  }

  Widget _getChild(int i) {
    return i == 0
        ? const WelcomeBody1()
        : i == 1
            ? const WelcomeBody2(image: 'assets/s15.jpg', text: middleText2)
            : const WelcomeBody2(image: 'assets/s4.jpg', text: middleText3);
  }
}
