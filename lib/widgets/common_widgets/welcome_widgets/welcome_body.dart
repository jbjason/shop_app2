import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/common_widgets/bubbles_.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_buttons.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_page1.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_page2.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({Key? key}) : super(key: key);
  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  final _currentIndex = ValueNotifier<int>(0);
  final _isLoading = ValueNotifier<bool>(true);

  @override
  void initState() {
    Provider.of<Products>(context, listen: false).fetchProducts().then((_) {
      return _isLoading.value = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Bubbles(
          bigBubble: Colors.white,
          smallBubble: AppColors.accent,
          secondBubble: AppColors.secondary,
          page: 'well',
        ),
        Positioned.fill(
          child: PageView.builder(
            itemCount: 2,
            onPageChanged: (index) => _currentIndex.value = index,
            itemBuilder: (context, i) {
              return i == 0 ? const WelcomePage1() : const WelcomePage2();
            },
          ),
        ),
        // counter & continue, admin buttons
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _isLoading,
            builder: (context, bool isLoading, _) => ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, int _index, _) =>
                  WelcomeButtons(currentIndex: _index, isLoading: isLoading),
            ),
          ),
        ),
      ],
    );
  }
}
