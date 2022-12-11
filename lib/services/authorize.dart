import 'dart:convert';

import 'package:http/http.dart';
import '../constants/values.dart';

import '../models/person_model.dart';

Future<Person?> authorize(String id, String phone) async {
  String authurl = "$url/authorize?reg-id=$id&phone=$phone";
  print("Beginning Authorize");
  Uri? uri = Uri.tryParse(authurl);
  try {
    if (uri != null) {
      Response response = await get(
        uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> m = jsonDecode(response.body);
        return Person.fromJson(m);
      }
      return null;
    } else {
      print("URI error");
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
