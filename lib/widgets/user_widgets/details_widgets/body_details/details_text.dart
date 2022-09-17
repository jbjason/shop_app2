import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:flutter/gestures.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final _isExpanded = ValueNotifier<bool>(false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(
        valueListenable: _isExpanded,
        builder: (context, _, __) => _detailsText(_isExpanded),
      ),
    );
  }

  Widget _detailsText(ValueNotifier<bool> isExpanded) {
    if (text.length > 190 && !isExpanded.value) {
      return RichText(
        text: TextSpan(
          text: text.substring(0, 190 + 1) + '.',
          style: const TextStyle(color: AppColors.textDark),
          children: [
            TextSpan(
              text: '...Read more',
              recognizer: TapGestureRecognizer()
                ..onTap = () => isExpanded.value = true,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    } else if (text.length < 190) {
      return Text(text);
    } else {
      return RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: '  ...Show less',
              style: const TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () => isExpanded.value = false,
            )
          ],
        ),
      );
    }
  }
}
