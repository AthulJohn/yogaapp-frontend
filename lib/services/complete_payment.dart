import 'dart:convert';

import 'package:http/http.dart';
import '../constants/values.dart';

import '../models/person_model.dart';

Future<bool> completePayment(int id) async {
  Uri? uri = Uri.tryParse("$url/payfees");
  try {
    if (uri != null) {
      Response response = await put(uri,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({"reg-id": id}));
      print(response.body);
      return response.statusCode == 200;
    } else {
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
