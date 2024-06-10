import 'package:doodleblue/utils/constant.dart';
import 'package:flutter/material.dart';

class RatingWithCounter extends StatelessWidget {
  const RatingWithCounter({
    Key? key,
    required this.rating,
    required this.numOfRating,
  }) : super(key: key);

  final double rating;
  final int numOfRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating.toString(),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: titleColor.withOpacity(0.74)),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.star,
          size: 12,
          color: Colors.green,
        ),
        const SizedBox(width: 8),
        Text("$numOfRating Reviews",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: titleColor.withOpacity(0.74))),
      ],
    );
  }
}
