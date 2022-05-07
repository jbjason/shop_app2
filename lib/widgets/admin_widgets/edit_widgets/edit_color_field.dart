import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class EditColorField extends StatelessWidget {
  const EditColorField(
      {Key? key,
      required this.allColors,
      required this.colorList,
      required this.deleteColor,
      required this.addColor})
      : super(key: key);
  final List<Color> allColors, colorList;
  final void Function(Color s, BuildContext ctx) addColor;
  final void Function(Color s) deleteColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _availableColors(),
        const SizedBox(height: 10),
        _imagesReviewList(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _availableColors() => SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: allColors.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => addColor(allColors[index], context),
            child: Container(
              height: 35,
              width: 35,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: allColors[index],
                border: Border.all(width: 4, color: Colors.white),
                boxShadow: getShadowBox(Colors.grey.shade500, Colors.white),
              ),
            ),
          ),
        ),
      );

  Widget _imagesReviewList() => SizedBox(
        height: 40,
        child: Row(
          children: [
            const Text('Chosen : '),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colorList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => deleteColor(colorList[index]),
                  child: Container(
                    height: 35,
                    width: 35,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: colorList[index],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    alignment: Alignment.topRight,
                    child:
                        const Icon(Icons.delete, size: 13, color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
