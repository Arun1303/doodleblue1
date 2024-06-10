import 'package:doodleblue/utils/constant.dart';
import 'package:doodleblue/view/components/dotindicator.dart';
import 'package:flutter/material.dart';

class BigCardImageSlide extends StatefulWidget {
  const BigCardImageSlide({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List images;

  @override
  _BigCardImageSlideState createState() => _BigCardImageSlideState();
}

class _BigCardImageSlideState extends State<BigCardImageSlide> {
  int intialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                intialIndex = value;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) =>
                BigCardImage(image: widget.images[index]),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                widget.images.length,
                (index) => DotIndicator(
                  isActive: intialIndex == index,
                  activeColor: Colors.white,
                  inActiveColor: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BigCardImage extends StatelessWidget {
  const BigCardImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        image: DecorationImage(
          // for newtowk image use NetworkImage()
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
