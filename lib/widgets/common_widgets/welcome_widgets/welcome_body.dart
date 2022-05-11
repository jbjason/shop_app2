import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/common_widgets/extra_/bubbles_.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_body1.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_body2.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_bottom_container.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);
  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  int _isSelected = 0;
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<Products>(context, listen: false)
        .fetchProducts()
        .then((_) => setState(() => _isLoading = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Bubbles(
          bigBubble: Colors.white,
          smallBubble: AppColors.accent,
          leftBubble: AppColors.secondary,
          rightBubble: Color.fromARGB(255, 38, 46, 97),
        ),
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
          child: WelcomeBottomContainer(
              isSelected: _isSelected, isLoading: _isLoading),
        ),
      ],
    );
  }

  Widget _getChild(int i) {
    return i == 0
        ? const WelcomeBody1()
        : i == 1
            ? const WelcomeBody2(image: 'assets/s11.jpg', text: welcomeText2)
            : const WelcomeBody2(image: 'assets/s4.jpg', text: welcomeText3);
  }
}
