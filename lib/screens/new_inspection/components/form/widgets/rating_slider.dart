import 'package:flutter/material.dart';

class RatingSlider extends StatefulWidget {
  final double currentSlideValue;
  const RatingSlider({super.key, this.currentSlideValue = 0});

  @override
  State<RatingSlider> createState() => _RatingSliderState();
}

class _RatingSliderState extends State<RatingSlider> {
  double _currentSlideValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSlideValue,
        label: _currentSlideValue.round().toString(),
        max: 5,
        divisions: 5,
        onChanged: (double value) {
          setState(() {
            _currentSlideValue = value;
          });
        });
  }
}
