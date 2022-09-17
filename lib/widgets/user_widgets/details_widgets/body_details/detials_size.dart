import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';

class DetailsSize extends StatelessWidget {
  const DetailsSize(
      {Key? key,
      required this.sizes,
      required this.color,
      required this.selectedSize})
      : super(key: key);
  final List<String> sizes;
  final Color color;
  final ValueNotifier<int> selectedSize;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedSize,
      builder: (context, int size, __) => ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 6),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: sizes.length,
        itemBuilder: (context, index) {
          final bool f = size == index;
          return InkWell(
            onTap: () => selectedSize.value = index,
            child: Container(
              child: Center(
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    color: (f && color.computeLuminance() < .5)
                        ? color
                        : Colors.black,
                  ),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
                border: Border.all(
                  color: f ? color : Colors.transparent,
                  width: 2,
                ),
                boxShadow: getShadowBox(Colors.grey[300]!, Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
