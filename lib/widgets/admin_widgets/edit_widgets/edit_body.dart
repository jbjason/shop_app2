import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/add_product_button.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_color_field.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_image_fields.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_size_field.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_text_fields.dart';

class EditBody extends StatefulWidget {
  const EditBody({Key? key, required this.isEdit}) : super(key: key);
  final String isEdit;
  @override
  State<EditBody> createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final _form = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _detailsController = TextEditingController();
  final _sizeController = TextEditingController();
  final _imageController = TextEditingController();
  List<String> _imagesList = [], _sizeList = [];
  List<Color> _colorList = [];
  final List<Color> _allColors = colorsList;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit.isNotEmpty) {
      final product =
          Provider.of<Products>(context, listen: false).findById(widget.isEdit);
      _titleController.text = product.title;
      _categoryController.text = product.category;
      _priceController.text = product.price.toString();
      _detailsController.text = product.description;
      _sizeList = product.size;
      _imagesList = product.imageUrl;
      _colorList = product.color;
      _sizeController.text = _sizeList[_sizeList.length - 1];
      _imageController.text = _imagesList[_imagesList.length - 1];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: SingleChildScrollView(
        child: Column(
          children: [
            getAppBarTile('Edit Products', context),
            const SizedBox(height: 20),
            EditTextFields(
                controller: _titleController, lines: 1, text: 'Title'),
            EditTextFields(
                controller: _categoryController, lines: 1, text: 'Category'),
            EditTextFields(
                controller: _priceController, lines: 1, text: 'Price'),
            EditTextFields(
                controller: _detailsController, lines: 3, text: 'Details'),
            EditSizeField(
                controller: _sizeController,
                function: addSize,
                sizeList: _sizeList),
            EditColorField(
                allColors: _allColors,
                colorList: _colorList,
                function: addColor),
            EditImageFields(
                controller: _imageController,
                function: addImage,
                imagesList: _imagesList),
            const SizedBox(height: 40),
            AddProductButton(submit: submit),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_form.currentState!.validate()) return;
    if (_colorList.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Choose a Color !')));
      return;
    }
    _form.currentState!.save();
    Provider.of<Products>(context, listen: false).addProduct(
      Product(
          id: DateTime.now().toString(),
          title: _titleController.text.trim(),
          description: _detailsController.text.trim(),
          category: _categoryController.text.trim(),
          price: double.parse(_priceController.text.trim()),
          imageUrl: _imagesList,
          color: _colorList,
          size: _sizeList),
    );
    Navigator.pop(context);
  }

  void addImage(String s) {
    _imagesList.add(s);
    setState(() {});
  }

  void addSize(String s) {
    _sizeList.add(s);
    setState(() {});
  }

  void addColor(Color color, BuildContext ctx) {
    final _id = _colorList.indexWhere((element) => element == color);
    if (_id == -1) {
      _colorList.add(color);
      _allColors.remove(color);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Already Selcted !')));
    }
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
