import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  final String title;
  final double controller;
  final Function(double) onChanged;
  const CustomRatingBar(
      {super.key,
      required this.title,
      required this.controller,
      required this.onChanged});

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18, /*fontWeight: FontWeight.bold*/
          ),
        ),
        const SizedBox(height: 5),
        ratingBar(),
        const SizedBox(height: 10),
      ],
    );
  }

  ratingBar() {
    return RatingBar.builder(
        initialRating: 0,
        minRating: 0,
        itemSize: 60,
        direction: Axis.horizontal,
        tapOnlyMode: false,
        itemCount: 6,
        //modificar de acuerdo al tamaño de pantalla
        itemPadding: const EdgeInsets.symmetric(horizontal: 30.0),
        itemBuilder: (context, index) {
          return Column(
            children: [
              const Icon(
                Icons.check_circle_outline_sharp,
              ),
              const SizedBox(width: 5),
              Text(
                index.toString(),
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
        onRatingUpdate: widget.onChanged);
  }
}
