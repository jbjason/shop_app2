import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/user_widgets/thanks_widgets/back_to_shop.dart';
import 'package:shop_app2/widgets/user_widgets/thanks_widgets/invoice_and_userinfo.dart';
import 'package:shop_app2/widgets/user_widgets/thanks_widgets/ordered_product_details.dart';
import 'package:shop_app2/widgets/user_widgets/thanks_widgets/total_amount_details.dart';

class ThanksScreen extends StatelessWidget {
  static const routeName = '/thanks-screen';
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final f = ModalRoute.of(context)!.settings.arguments as List<String>;
    final String name = f[0], email = f[1], contact = f[2], address = f[3];
    final double finalAmount = double.parse(f[4]);
    final String orderId = f[5];
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            // invoice details
            InvoiceAndUserInfo(
                orderId: orderId,
                size: size,
                name: name,
                email: email,
                address: address,
                contact: contact),
            const SizedBox(height: 15),
            // ordered Products details
            const OrderedProductDetails(),
            // amount details
            TotalAmountDetails(
                finalAmount: finalAmount,
                finalPoint: 23,
                finalVoucher: 2,
                width: size.width),
            // bottom button
            BackToShopButton(width: size.width),
          ],
        ),
      )),
    );
  }
}
