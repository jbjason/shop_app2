import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_image_fields.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_text_fields.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _detailsController = TextEditingController();
  final _imageController = TextEditingController();
  final List<String> _imagesList = [];
  @override
  Widget build(BuildContext context) {
    // final _isEdit = widget.keyText == 'edit' ? true : false;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(key: _form, child: _body()),
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          EditTextFields(controller: _titleController, lines: 1, text: 'title'),
          EditTextFields(
              controller: _categoryController, lines: 1, text: 'cat'),
          EditTextFields(controller: _priceController, lines: 1, text: 'price'),
          EditTextFields(controller: _detailsController, lines: 3, text: 'dtl'),
          EditImageFields(
              controller: _imageController,
              function: addImage,
              imagesList: _imagesList),
          const SizedBox(height: 20),
          _addButton(),
        ],
      ),
    );
  }

  Widget _addButton() => Center(
        child: getButtonDecoration(
          70,
          MediaQuery.of(context).size.width,
          BoxShape.rectangle,
          getShadowBox(Colors.grey.shade900, Colors.white),
          InkWell(
            onTap: () {},
            child: Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Text(
                'Add Product',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    wordSpacing: 1.5),
              ),
            ),
          ),
        ),
      );

  void addImage(String s) {
    _imagesList.add(s);
    _imageController.text = '';
    setState(() {});
  }
}
