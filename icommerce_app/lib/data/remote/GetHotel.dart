import 'package:widget/class/Crude.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';

class GetHotel {
  Crude crude;
  GetHotel(this.crude);
  getdata() async {
    var response =
        await crude.getdata(getHotel, {"user": shardp!.getString("id")});

    return response.fold((left) => left, (right) => right);
  }

  getImages(String id) async {
    var response = await crude.getdata(getImagess, {"id_Hotel": id});
    return response.fold((left) => left, (right) => right);
  }

  getSitutaion(String id) async {
    var response = await crude.getdata(getSituation, {"id_Hotel": id});
    return response.fold((left) => left, (right) => right);
  }
  getCommantaire(String id)async {
    var response = await crude.getdata(getCommentaire, {"id_Hotel": id});
    return response.fold((left) => left, (right) => right);
  }
    addCommantaire(String id,String desc)async {
    var response = await crude.getdata(addCommantairee, {
      "id_user":shardp!.getString("id"),
      "id_Hotel": id,
      "desc":desc
    });
    return response.fold((left) => left, (right) => right);
  }
}
