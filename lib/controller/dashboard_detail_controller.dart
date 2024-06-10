import 'dart:io';

import 'package:doodleblue/model/business_details.dart';
import 'package:doodleblue/model/business_model.dart';
import 'package:doodleblue/model/business_model.dart' as d;

import 'package:doodleblue/service/apiservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DashBoardDetailsController extends ControllerMVC {
  BusinessDetails? businessDetails;

  var globalkey = GlobalKey<ScaffoldState>();

  DashBoardDetailsController() {
    //getTodayNews();
  }
  getBusiness(String id) async {
    try {
      businessDetails = await ApiService().getBusinessById(id);
      print(businessDetails);
      setState(() {});
    } catch (e) {
      if (Platform.isIOS) {
        _showAlertDialogiOS(
            globalkey.currentContext!, 'Search Server', "failed due to $e");
      } else {
        showAlertDialog(
            globalkey.currentContext!, 'Search Server', "failed due to $e");
      }
    }
  }

  showAlertDialog(BuildContext context, String title, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _showAlertDialogiOS(BuildContext context, String title, String message) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
