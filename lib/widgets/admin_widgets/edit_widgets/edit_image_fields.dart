import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class EditImageFields extends StatelessWidget {
  const EditImageFields(
      {Key? key,
      required this.controller,
      required this.addImage,
      required this.deleteImage,
      required this.imagesList})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String s) addImage, deleteImage;
  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _imageTextField(),
        const SizedBox(height: 20),
        _chosenList(),
      ],
    );
  }

  Widget _imageTextField() => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 100,
            width: 100,
            margin: const EdgeInsets.only(top: 8, right: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColors.accent),
            ),
            child: controller.text.isEmpty
                ? const Center(child: Text('Enter a URL'))
                : Image.network(controller.text.trim(), fit: BoxFit.cover),
          ),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Image Url'),
              keyboardType: TextInputType.url,
              controller: controller,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty && imagesList.isEmpty) {
                  return 'Please enter a Url';
                } else if ((!value.startsWith('http') &&
                    !value.startsWith('https'))) {
                  return 'Please enter a valid Url';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if (value.isNotEmpty ||
                    value.startsWith('http') ||
                    value.startsWith('https')) {
                  addImage(value);
                }
              },
            ),
          ),
        ],
      );

  Widget _chosenList() => SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagesList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => deleteImage(imagesList[index]),
            child: Container(
              width: 45,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imagesList[index]), fit: BoxFit.cover),
              ),
              alignment: Alignment.bottomRight,
              child: const Icon(Icons.delete, size: 22, color: Colors.red),
            ),
          ),
        ),
      );
}
