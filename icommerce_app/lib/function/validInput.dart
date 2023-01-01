

import 'package:get/get.dart';

valideInbut(var val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not valide username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not valide Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Note valide number";
    }
  }


  if (min > val.length) {
    return "min Not";
  }
  if (max < val.length) {
    return "max Not";
  }

  if (val.isEmpty) {
    return "Not Empty";
  }
}
