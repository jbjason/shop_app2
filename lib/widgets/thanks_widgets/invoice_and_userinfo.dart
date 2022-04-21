import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InvoiceAndUserInfo extends StatelessWidget {
  const InvoiceAndUserInfo(
      {Key? key,
      required this.orderId,
      required this.size,
      required this.name,
      required this.address,
      required this.contact})
      : super(key: key);
  final Size size;
  final String name, orderId, address, contact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _pinkText(),
        _invoiceTextAndId(),
        _userInfoDetails(),
      ],
    );
  }

  Widget _pinkText() => Container(
        color: Colors.pink,
        height: 23,
        width: size.width,
        child: const Text(
          'Your order has been placed successfully !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

  Widget _invoiceTextAndId() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.grey[400],
      child: Row(
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('INVOICE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              const SizedBox(height: 8),
              Text('OrderId : $orderId'),
              Text(
                  'Date : ${DateFormat('dd-mm -yyyy').format(DateTime.now())}'),
            ],
          )
        ],
      ),
    );
  }

  Widget _userInfoDetails() {
    return Material(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bill TO : ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Name : $name', overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Text('Address : $address', overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Text('Contact : $contact'),
            const SizedBox(height: 16),
            const Center(
              child: Text('* Estimated Delivary in 7days *',
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
