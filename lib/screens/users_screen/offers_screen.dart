import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/user_widgets/offer_widgets/offer_body.dart';
import 'package:shop_app2/widgets/user_widgets/offer_widgets/offer_details.dart';

class OffersScreen extends StatefulWidget {
  static const routeName = '/offers-screen';
  const OffersScreen({Key? key}) : super(key: key);
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _backgroundImage(),
            ValueListenableBuilder<double>(
              valueListenable: _notifierScroll,
              builder: (context, value, _) => _body(context, value),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: getAppBarTile('My Offers', context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, double value) {
    final products = Provider.of<Products>(context, listen: false).items;
    final size = MediaQuery.of(context).size;
    return PageView.builder(
      controller: _controller,
      itemCount: 5,
      itemBuilder: (context, index) {
        final percent = index - value;
        final rotation = percent.clamp(0.0, 1.0);
        return Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // initial height: .45 width .6
              OfferBody(
                  rotation: rotation,
                  size: size,
                  image: 'assets/offer/offer$index.jpg'),
              SizedBox(height: size.height * .05),
              OfferDetails(
                rotation: rotation,
                index: index,
                product: products[index],
                height: size.height * .28,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _backgroundImage() => Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
        ),
      );

  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }
}
