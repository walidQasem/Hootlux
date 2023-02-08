import 'package:connectivity_plus/connectivity_plus.dart';

checkInterNet() async {
  var res = await Connectivity().checkConnectivity();
  if (res == ConnectivityResult.none) {
    return "non";
  } else {
    return "oui";
  }
}
