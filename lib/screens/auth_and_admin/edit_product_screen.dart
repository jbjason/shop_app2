import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_color_field.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_image_fields.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_size_field.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_text_fields.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product-screen';
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
  final _sizeController = TextEditingController();
  final List<String> _imagesList = [], _sizeList = [];
  final List<Color> _colorList = [];
  final List<Color> _allColors = colorsList;
  @override
  Widget build(BuildContext context) {
    // final _isEdit = widget.keyText == 'edit' ? true : false;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(key: _form, child: _body(context)),
        ),
      ),
    );
  }

  Widget _body(BuildContext ctx) {
    return SingleChildScrollView(
      child: Column(
        children: [
          getAppBarTile('Edit Products', ctx),
          EditTextFields(controller: _titleController, lines: 1, text: 'Title'),
          EditTextFields(
              controller: _categoryController, lines: 1, text: 'Category'),
          EditTextFields(controller: _priceController, lines: 1, text: 'Price'),
          EditTextFields(
              controller: _detailsController, lines: 3, text: 'Details'),
          EditImageFields(
              controller: _imageController,
              function: addImage,
              imagesList: _imagesList),
          EditSizeField(
              function: addSize,
              sizeList: _sizeList),
          EditColorField(
              allColors: _allColors, colorList: _colorList, function: addColor),
          const SizedBox(height: 40),
          _addButton(),
        ],
      ),
    );
  }

  Widget _addButton() => InkWell(
        onTap: () {},
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
          decoration: BoxDecoration(
            boxShadow: getShadowBox(Colors.grey[500]!, Colors.white),
            color: Colors.grey[300],
          ),
          alignment: Alignment.center,
          child: const Text(
            'Add Product',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                wordSpacing: 1.5),
          ),
        ),
      );

  void addImage(String s) {
    _imagesList.add(s);
    setState(() {});
  }

  void addSize(String s) {
    _sizeList.add(s);
    setState(() {});
  }

  void addColor(Color color) {
    _colorList.add(color);
    _allColors.remove(color);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _detailsController.dispose();
    _imageController.dispose();
    _sizeController.dispose();
  }
}
