import 'package:doodleblue/model/business_details.dart';
import 'package:doodleblue/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final BusinessDetails product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
                height: 1.5, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            product.location.displayAddress.join(','),
            style: const TextStyle(height: 1.5),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            product.displayPhone,
            style: const TextStyle(height: 1.5),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Open hours :',
            style: const TextStyle(height: 1.5),
          ),
          const SizedBox(
            height: 10,
          ),
          product.hours.isNotEmpty
              ? Column(
                  children: product.hours.first.open
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                                'Day : ${e.day}   Starts :${_convertToTime(e.start.toString())}   Ends :${_convertToTime(e.end.toString())}'),
                          ))
                      .toList(),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  _convertToTime(String key) {
    var d =
        key.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)} ");

    DateFormat dateFormat = DateFormat("HH mm");
    var dateTime = dateFormat.parse(d);
    DateFormat dateFormatTarget = DateFormat("hh:mm a");
    return dateFormatTarget.format(dateTime);
  }
}
