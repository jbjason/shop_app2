import 'package:flutter/material.dart';

class SortBySlider extends StatelessWidget {
  const SortBySlider({Key? key, required this.highValue}) : super(key: key);
  final ValueNotifier<double> highValue;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: highValue,
      builder: (context, double _highVal, _) {
        RangeValues values = RangeValues(0, _highVal);
        return SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            thumbColor: Colors.red,
            activeTrackColor: Colors.red.shade200,
            inactiveTrackColor: Colors.red.shade50,
            rangeThumbShape:
                const RoundRangeSliderThumbShape(enabledThumbRadius: 6),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
          ),
          child: RangeSlider(
            values: values,
            min: 0,
            max: 4000,
            divisions: 4,
            labels: RangeLabels(
              values.start.round().toString(),
              values.end.round().toString(),
            ),
            onChanged: (val) {
              // this is for chaing slider value
              _highVal = val.end;
              // this is for passing notified value to sort_by_screen
              highValue.value = val.end;
            },
          ),
        );
      },
    );
  }
}
