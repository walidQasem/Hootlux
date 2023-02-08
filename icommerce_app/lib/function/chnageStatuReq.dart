import 'package:http/http.dart';
import 'package:widget/class/staturequest.dart';

chnageStatuReq(response) {
  if (response is StatusRequest) {
    return response;
  }
   else {
    return StatusRequest.success;
  }
}
