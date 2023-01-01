import 'dart:convert';

import 'package:http/http.dart' as http;




postdata(String url, Map data) async {
    var response = await http.post(Uri.parse(url), body: data);
    if(response.statusCode==200){

      var responosebodye = jsonDecode(response.body);
       return responosebodye;
    }
   
}

getdata(String url) async {
    var response = await http.post(Uri.parse(url));
    var responosebodye = jsonDecode(response.body);
    return responosebodye;
}