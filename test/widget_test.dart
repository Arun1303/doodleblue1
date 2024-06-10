// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:doodleblue/model/business_model.dart';
import 'package:doodleblue/service/apiservice.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  group('getapiFromYelp', () { 
      test('Fetch APi', () async{
      bool success = false;
      var fetchBusiness = (await ApiService().getBusinessBySearch(1)).businesses;
      if (fetchBusiness != null) {
        success = true;
      } else {
        success = false;
      }
      expect(success, true);
      });

    test('Fetch APi by ID', () async{
      bool success = false;
      var fetchBusiness = (await ApiService().getBusinessById('VvsZAnEwU4c8Xkyrzx05Nw')).name;
      if (fetchBusiness != null) {
        success = true;
      } else {
        success = false;
      }
      expect(success, true);
      });
  });
}
