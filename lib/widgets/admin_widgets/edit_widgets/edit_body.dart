import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/constants_others.dart';
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
  final _subtitleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _detailsController = TextEditingController();
  final _sizeController = TextEditingController();
  final _imageController = TextEditingController();
  List<String> _imagesList = [], _sizeList = [];
  List<Color> _colorList = [];
  final List<Color> _allColors = colorsList;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.isEdit.isNotEmpty) {
      final product =
          Provider.of<Products>(context, listen: false).findById(widget.isEdit);
      _titleController.text = product.title;
      _subtitleController.text = product.subtitle;
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
                controller: _titleController, lines: 1, text: 'Subtitle'),
            EditTextFields(
                controller: _categoryController, lines: 1, text: 'Category'),
            EditTextFields(
                controller: _priceController, lines: 1, text: 'Price'),
            EditTextFields(
                controller: _detailsController, lines: 3, text: 'Details'),
            EditSizeField(
                controller: _sizeController,
                addSize: addSize,
                deleteSize: deleteSize,
                sizeList: _sizeList),
            EditColorField(
                allColors: _allColors,
                colorList: _colorList,
                deleteColor: deleteColor,
                addColor: addColor),
            EditImageFields(
                controller: _imageController,
                addImage: addImage,
                deleteImage: deleteImage,
                imagesList: _imagesList),
            const SizedBox(height: 40),
            AddProductButton(
                submit: submit, isEdit: widget.isEdit, isLoading: _isLoading),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_form.currentState!.validate()) return;
    if (_colorList.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Choose a Color !')));
      return;
    }
    _form.currentState!.save();
    setState(() => _isLoading = true);
    // managing the product
    final f = Product(
        id: widget.isEdit.isEmpty ? DateTime.now().toString() : widget.isEdit,
        title: _titleController.text.trim(),
        subtitle: _subtitleController.text.trim(),
        description: _detailsController.text.trim(),
        category: _categoryController.text.trim(),
        price: double.parse(_priceController.text.trim()),
        imageUrl: _imagesList,
        color: _colorList,
        size: _sizeList);
    if (widget.isEdit.isEmpty) {
      Provider.of<Products>(context, listen: false).addProduct(f);
    } else {
      Provider.of<Products>(context, listen: false).updateProduct(f);
    }
    Navigator.pop(context);
  }

  void addImage(String s) {
    _imagesList.add(s);
    setState(() {});
  }

  void deleteImage(String s) {
    _imagesList.remove(s);
    setState(() {});
  }

  void addSize(String s) {
    _sizeList.add(s);
    setState(() {});
  }

  void deleteSize(String s) {
    _sizeList.remove(s);
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

  void deleteColor(Color c) {
    _colorList.remove(c);
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
