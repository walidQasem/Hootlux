import 'package:widget/class/Crude.dart';
import 'package:widget/constant/url.dart';

class Favorite_data {
  Crude c;
  Favorite_data(this.c);

  add_Fav(String idHotel, String idUser) async {
    var response =
        await c.getdata(addfavorite, {"id_Hotel": idHotel, "id_User": idUser});
    response.fold((left) => left, (right) => right);
  }

  del_Fav(String idHotel, String idUser) async {
    var response = await c
        .getdata(deletfavorite, {"id_Hotel": idHotel, "id_User": idUser});
    response.fold((left) => left, (right) => right);
  }

  getFav() async {
    var respons = await c.getdata(
        "http://192.168.1.26/ecommerce/hotel/GetFavorite.php",
        {"id_User": "87"});
    return respons.fold((left) => left, (right) => right);
  }


}
