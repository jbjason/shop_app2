import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/widgets/confirm_widgets/user_contact_field.dart';
import 'package:shop_app2/widgets/confirm_widgets/user_details_field.dart';
import 'package:shop_app2/widgets/confirm_widgets/user_email_field.dart';
import 'package:shop_app2/widgets/confirm_widgets/user_name_field.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              getAppBarTile('Your Details', context),
              const SizedBox(height: 20),
              _textFields(),
              _addToCartButton(size.width),
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

  Widget _addToCartButton(double width) {
    return Center(
      child: getButtonDecoration(
        70,
        width,
        BoxShape.rectangle,
        getShadowBox(Colors.grey.shade900, Colors.white),
        InkWell(
          onTap: () => submitFunction(),
          child: Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text('Confirm Done!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    wordSpacing: 1.5)),
          ),
        ),
      ),
    );
  }

  void submitFunction() {
    if (!_form.currentState!.validate()) return;
    _form.currentState!.save();
    _email = _emailController.text.trim();
    _name = _nameController.text.trim();
    _contact = _contactController.text.trim();
    _address = _addressController.text.trim();
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
