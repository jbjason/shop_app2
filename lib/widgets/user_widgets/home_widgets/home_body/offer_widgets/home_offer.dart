import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/widgets/common_widgets/counter_container.dart';

class HomeOffer extends StatefulWidget {
  const HomeOffer({Key? key}) : super(key: key);
  @override
  State<HomeOffer> createState() => _HomeOfferState();
}

class _HomeOfferState extends State<HomeOffer> {
  final _controller = PageController(initialPage: 1, viewportFraction: .8);
  final _currentIndex = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .14,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: 5,
            onPageChanged: (index) => _currentIndex.value = index,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: AppColors.accent),
                  image: DecorationImage(
                    image: AssetImage('assets/offer$i.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: size.width * .5 - 75,
            child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, int index, _) =>
                  CounterContainer(currentIndex: index, length: 5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
