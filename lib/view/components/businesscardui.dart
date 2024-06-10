import 'package:doodleblue/utils/constant.dart';
import 'package:doodleblue/view/components/bigcardimage.dart';
import 'package:doodleblue/view/components/pricerangeandfoodtype.dart';
import 'package:doodleblue/view/components/ratingwithcounter.dart';
import 'package:doodleblue/view/components/smalldot.dart';
import 'package:flutter/material.dart';

class BusinessCardUI extends StatelessWidget {
  final List<String> images, address;
  final String name;
  final double rating;
  final int numOfRating;
  final double distance;
  final bool isFreeDelivery;
  final VoidCallback press;

  const BusinessCardUI({
    Key? key,
    required this.name,
    required this.rating,
    required this.numOfRating,
    required this.distance,
    this.isFreeDelivery = true,
    required this.images,
    required this.address,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigCardImageSlide(images: images),
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(name, style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: defaultPadding / 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: PriceRangeAndFoodtype(foodType: address),
          ),
          const SizedBox(height: defaultPadding / 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                RatingWithCounter(rating: rating, numOfRating: numOfRating),
                const SizedBox(width: defaultPadding / 2),
                Text(
                  "${distance.toStringAsFixed(2)} Km",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: SmallDot(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
