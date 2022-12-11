import 'package:flutter/cupertino.dart';

import '../constants/values.dart';

class Person extends ChangeNotifier {
  String name, phone;
  int slot, age;
  int? changedslot;
  DateTime? feePaidMonth, registerDate;
  int id;
  Person(
      {required this.name,
      required this.phone,
      required this.slot,
      required this.age,
      this.id = -1,
      this.changedslot,
      this.feePaidMonth,
      this.registerDate});

  Person.empty()
      : this(
          name: "",
          phone: "",
          slot: -1,
          age: -1,
        );

  Person.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
          phone: json["phone"],
          slot: json["slot"],
          age: json["age"],
          id: json["reg_id"],
          changedslot: json["changedSlot"],
          feePaidMonth: DateTime.tryParse(json["lastFeePaidMonth"] ?? ""),
          registerDate: DateTime.tryParse(json["registerDate"] ?? ""),
        );

  void setPerson(Person p) {
    print(p.feePaidMonth);
    name = p.name;
    phone = p.phone;
    slot = p.slot;
    age = p.age;
    id = p.id;
    changedslot = p.changedslot;
    feePaidMonth = p.feePaidMonth;
    registerDate = p.registerDate;
    print(feePaidMonth);
    notifyListeners();
  }

  void changeSlot(int val) {
    changedslot = val;
    print(changedslot);
    notifyListeners();
  }

  void payFees() {
    feePaidMonth = DateTime.now();
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "slot": "$slot",
      "age": "$age",
    };
  }

  String get getFeesStatus {
    if (feePaidMonth == null) {
      return "RNP"; //"Registration Fees not Paid";
    }
    if (feePaidMonth!.month == DateTime.now().month) {
      return "P"; //"No Fees Due (Paid)";
    } else if ((feePaidMonth!.month + 1) % 12 == DateTime.now().month) {
      return "D"; //"Fees Due for 1 month";
    } else {
      return "M"; // Fees due for Multiple months
    }
  }

  int get getDueMonths {
    int no = 0;
    if (feePaidMonth == null) {
      if (registerDate == null) return 1;
      no = (DateTime.now().year - registerDate!.year) * 12;
      no += (DateTime.now().month - registerDate!.month + 1);
      return no;
    }
    if (feePaidMonth!.month == DateTime.now().month) {
      return 0;
    } else {
      no = (DateTime.now().year - feePaidMonth!.year) * 12;
      no += (DateTime.now().month - feePaidMonth!.month);
      return no;
    }
  }

  String get getBeutifiedFeesStatus {
    if (feePaidMonth == null) {
      return "Registration Fees not Paid";
    }
    if (feePaidMonth!.month == DateTime.now().month) {
      return "No Fees Due (Paid)";
    } else {
      return "Fees Due from ${months[feePaidMonth!.month - 1]}";
    }
  }
}
