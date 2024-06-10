import 'dart:convert';
import 'package:doodleblue/utils/constant.dart';
import 'package:http/http.dart' as http;

import '../model/business_details.dart';
import '../model/business_model.dart';

class ApiService {
  Future<Welcome> getBusinessBySearch(int page) async {
    var searchAPis = '$searchapi?location=NYC&offset=$page&limit=20';
    Uri getBusinessurl = Uri.parse(searchAPis);
    try {
      final response = await http.get(getBusinessurl, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      });
      if (response.statusCode == 200) {
        final welcomeDetails = Welcome.fromJson(json.decode(response.body));

        return welcomeDetails;
      } else {
        return Welcome.fromJson({});
      }
    } catch (e) {
      print(e.toString());
      return Welcome.fromJson({});
    }
  }

  Future<BusinessDetails> getBusinessById(String id) async {
    Uri getBusinessurlbyID = Uri.parse('$getbusinessbyid/$id');
    try {
      final response = await http.get(getBusinessurlbyID, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': bearerToken,
      });
      if (response.statusCode == 200) {
        final businessDetails =
            BusinessDetails.fromJson(jsonDecode(response.body));
        return businessDetails;
      } else {
        return BusinessDetails.fromJson({});
      }
    } catch (e) {
      return BusinessDetails.fromJson({});
    }
  }
}
