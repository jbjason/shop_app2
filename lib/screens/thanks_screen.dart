import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/thanks_widgets/back_to_shop.dart';
import 'package:shop_app2/widgets/thanks_widgets/invoice_and_userinfo.dart';
import 'package:shop_app2/widgets/thanks_widgets/ordered_product_details.dart';
import 'package:shop_app2/widgets/thanks_widgets/total_amount_details.dart';

class ThanksScreen extends StatefulWidget {
  static const routeName = '/thanks-screen';
  const ThanksScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ThanksScreen> createState() => _ThanksScreenState();
}

class _ThanksScreenState extends State<ThanksScreen> {
  ConfettiController? _controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _body(context, size),
            _conflettiAnimation(),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, Size size) {
    final f = ModalRoute.of(context)!.settings.arguments as List<String>;
    final String name = f[0], email = f[1], contact = f[2], address = f[3];
    final double finalAmount = double.parse(f[4]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        children: [
          InvoiceAndUserInfo(
              orderId: '12345678',
              size: size,
              name: name,
              email: email,
              address: address,
              contact: contact),
          const OrderedProductDetails(),
          //ProductsDetails(finalProduct: finalProduct),
          TotalAmountDetails(
              finalAmount: finalAmount,
              finalPoint: 23,
              finalVoucher: 2,
              width: size.width),
          BackToShopButton(width: size.width),
        ],
      ),
    );
  }

  Widget _conflettiAnimation() => Align(
        alignment: Alignment.bottomCenter,
        child: ConfettiWidget(
          confettiController: _controller!,
          blastDirection: -pi / 2,
          emissionFrequency: 0.01,
          numberOfParticles: 30,
          maxBlastForce: 130,
          minBlastForce: 80,
        ),
      );
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    _controller!.play();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}
