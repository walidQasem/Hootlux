import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';

import '../../class/Crude.dart';

class Addfavrite {
  Crude crude;
  Addfavrite(this.crude);
  
  deletefav(String id) async {
    var response = await crude.getdata(
        deletfavorite, {"id_User": shardp!.getString("id"), "id_Hotel": id});
            return response.fold((left) => left, (right) => right);
  }

  addfav(String id) async {
    var response = await crude.getdata(
        addfavorite, {"id_User": shardp!.getString("id"), "id_Hotel": id});

    return response.fold((left) => left, (right) => right);
  }

    getFav(String idUser) async {
      var respons = await crude.getdata(
        getFavorite,
        {"id_User": idUser}
        
        );
    return respons.fold((left) => left, (right) => right);
  }
}
