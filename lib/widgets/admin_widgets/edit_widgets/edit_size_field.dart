import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class EditSizeField extends StatelessWidget {
  const EditSizeField(
      {Key? key,
      required this.controller,
      required this.addSize,
      required this.deleteSize,
      required this.sizeList})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String s) addSize, deleteSize;
  final List<String> sizeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sizeTextField(),
        const SizedBox(height: 10),
        _chosenList(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _sizeTextField() => TextFormField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Size'),
        maxLines: 1,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value!.isEmpty && sizeList.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        onFieldSubmitted: (val) {
          if (val.isNotEmpty) {
            addSize(val);
          }
        },
      );
  Widget _chosenList() => SizedBox(
        height: 45,
        child: Row(
          children: [
            const Text('Chosen :  '),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sizeList.length,
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () => deleteSize(sizeList[index]),
                  child: Container(
                    width: 50,
                    margin: const EdgeInsets.only(right: 7),
                    child: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.accent, width: 1)),
                          child: Text(
                            sizeList[index],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 0,
                          child:
                              Icon(Icons.delete, size: 20, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
