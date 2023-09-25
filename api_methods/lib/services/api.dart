import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  //the below given URL will remain same for all except for the IP part
  // all you have to do is just change 192.168.1.38 with your machine IP address
  static const baseUrl = "http://192.168.1.38:5000/api/";
  // function that illustrate the Post API Method
  //can be used directly for any Post request required by any STICK feature
  // change the function name accordingly
  static checkUsername(Map data) async {
    var url = Uri.parse("${baseUrl}userAuth/checkForUsername");
    // url is basically the endpoint that vikalp bhai will provide you or you can take the endpoint from POSTMAN too
    try {
      // always use try catch block to make the APP crash free
      final res = await http.post(url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(data));
      //print(jsonDecode(res.body.toString()));

      if (res.statusCode == 200) {
        var receivedData = jsonDecode(res.body.toString());
        // received data is your property you can take the useful information from it and use the info according to the needs of the screens
        print(receivedData);
      } else {
        print(jsonDecode(res.body.toString()));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // function that illustrate the GET API Method
  // this function can also be directly used with some minimal changes
  // change the function name accordingly
  static getRequest(data) async {
    var url = Uri.parse("${baseUrl}userInfo/getUser/${data}");
    // url is basically the endpoint that vikalp bhai will provide you or you can take the endpoint from POSTMAN too
    try {
      // always use try catch block to make the APP crash free
      final res = await http.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        // received data is your property you can take the useful information from it and use the info according to the needs of the screens
        print(data);
        return res.body;
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // function that illustrate the UPDATE API Method
  // this function is rarely used but should be handled carefully
  // change the function name accordingly
  static updateRequest(body) async {
    var url = Uri.parse("${baseUrl}userInfo/updateUser");
    // url is basically the endpoint that vikalp bhai will provide you or you can take the endpoint from POSTMAN too
    try {
      // always use try catch block to make the APP crash free
      final res = await http.patch(url,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            "authToken":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTA1Njc1Yjg2ZTBlMTk1MmFmZGFlZjkiLCJpYXQiOjE2OTU2NjQ4MDJ9.VWjMaa5tGR4Pm3TxZzD-fkIiDGXE9wUFF9e2856Va-0"
            // the token given here is actually HARD CODED but you have to pass the authtoken that will be dynamic
            // that is it changes as the user login again and unique for every user
          },
          body: jsonEncode(body));

      if (res.statusCode == 200) {
        print(jsonDecode(res
            .body)); // in this mostly messgaes for success and failure is shown so a small task to handle with received data
      } else {
        print("failed to update data");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // function that illustrate the DELETE API Method
  // this function is less used but should be handled carefully
  // change the function name accordingly
  static DeleteRequest(data) async {
    try {
      var url = Uri.parse(
          "${baseUrl}discussions/discussion/delete-discussion/${data}");
      // url is basically the endpoint that vikalp bhai will provide you or you can take the endpoint from POSTMAN too
      final res = await http.delete(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "authToken":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTA1Njc4Mzg2ZTBlMTk1MmFmZGFmMDIiLCJpYXQiOjE2OTU2NjU0NzJ9.eHYCXBdCCuYQfhnHVF4HVB3paC-Oft7PoB4B4QajgiQ"
          // the token given here is actually HARD CODED but you have to pass the authtoken that will be dynamic
          // that is it changes as the user login again and unique for every user
        },
      );

      if (res.statusCode == 200) {
        // in this mostly messgaes for success and failure is shown so a small task to handle with received data
        print(jsonDecode(res.body));
      } else {
        // print("failed to delete the data ");
        print(jsonDecode(res.body)["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
