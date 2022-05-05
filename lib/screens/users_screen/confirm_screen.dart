import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/screens/users_screen/thanks_screen.dart';
import 'package:shop_app2/widgets/user_widgets/confirm_widgets/confirm_button.dart';
import 'package:shop_app2/widgets/user_widgets/confirm_widgets/user_contact_field.dart';
import 'package:shop_app2/widgets/user_widgets/confirm_widgets/user_details_field.dart';
import 'package:shop_app2/widgets/user_widgets/confirm_widgets/user_email_field.dart';
import 'package:shop_app2/widgets/user_widgets/confirm_widgets/user_name_field.dart';

class ConfirmScreen extends StatefulWidget {
  static const routeName = '/confirm-screen';
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  int value = 0;
  final _form = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  String _name = '', _email = '', _address = '', _contact = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/cart_.png'),
                  fit: BoxFit.contain)),
          child: Column(
            children: [
              getAppBarTile('Your Details', context),
              const SizedBox(height: 20),
              _textFields(),
              ConfirmButton(width: size.width, submitFunction: submitFunction),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFields() {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(children: [
            UserNameField(nameController: _nameController),
            // email
            UserEmailField(emailController: _emailController),
            //contact no
            UserContactField(contactController: _contactController),
            //details
            UserDetailsField(addressController: _addressController),
          ]),
        ),
      ),
    );
  }

  void submitFunction() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_form.currentState!.validate()) return;
    _form.currentState!.save();
    _name = _nameController.text.trim();
    _email = _emailController.text.trim();
    _contact = _contactController.text.trim();
    _address = _addressController.text.trim();
    final cartItems = Provider.of<Cart>(context, listen: false);
    final total = cartItems.totalAmount;
    Provider.of<Orders>(context, listen: false)
        .addOrder(cartItems.items, total);
    Navigator.of(context).pushNamed(ThanksScreen.routeName,
        arguments: [_name, _email, _contact, _address, total.toString()]);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _contactController.dispose();
  }
}
