import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class EditColorField extends StatelessWidget {
  const EditColorField(
      {Key? key,
      required this.allColors,
      required this.colorList,
      required this.function})
      : super(key: key);
  final List<Color> allColors, colorList;
  final void Function(Color s, BuildContext ctx) function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allColors.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => function(allColors[index], context),
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
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              const Text('Chosen : '),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      colorList.length,
                      (index) => Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: colorList[index],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
