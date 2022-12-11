import 'dart:convert';

import 'package:http/http.dart';
import '../constants/values.dart';

Future<bool> changeSlot(int id, int slot) async {
  Uri? uri = Uri.tryParse("$url/changeslot");
  try {
    if (uri != null) {
      Response response = await put(uri,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: jsonEncode({"reg-id": id, "slot": slot}));
      print(response.body);
      return response.statusCode == 200;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
