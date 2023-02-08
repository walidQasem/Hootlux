import 'package:widget/class/Crude.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';

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
    var respons = await c
        .getdata(getFavorite, {"id_User": shardp!.getString("id").toString()});
    return respons.fold((left) => left, (right) => right);
  }

  getFacility() async {
    var respons = await c.getdata(getSituation, {});
    return respons.fold((left) => left, (right) => right);
  }

  add_Boking(String idhotel, DateTime datS, DateTime dateE, String nbrChilren,
      String nbrEdult, String total) async {
    var res = await c.getdata(addBoking, {
      "id_user": shardp!.getString("id").toString(),
      "id_Hotel": idhotel,
      "date_start": datS.toString(),
      "date_end": dateE.toString(),
      "Number_of_Children": nbrChilren,
      "number_of_adults": nbrEdult,
      "Total_amount": total,
    });
    return res.fold((left) => left, (right) => right);
  }

  deleteBooking(String idBooking) async {
    var response =
        await c.getdata(deleteBookinge, {"id_booking": idBooking.toString()});
    return response.fold((left) => left, (right) => right);
  }

  get_Booking() async {
    var resp = await c
        .getdata(getBooking, {"id_User": shardp!.getString("id").toString()});
    return resp.fold((left) => left, (right) => right);
  }

  is_Booking(String idHotel) async {
    var resp = await c.getdata(isbooking,
        {"id_user": shardp!.getString("id").toString(), "id_Hotel": idHotel});
    return resp.fold((left) => left, (right) => right);
  }

  uploadImage(dynamic nameimage, dynamic image64) async {
    var response = await c.getdata(uploadImagee, {
      "imagename": nameimage,
      "imgae64": image64,
      "id_user": shardp!.getString("id").toString()
    });
    return response.fold((left) => left, (right) => right);
  }

  getBookingDashboard() async {
    var response = await c.getdata(
        getBookingDashboardd, {"id_user": shardp!.getString("id").toString()});
    return response.fold((left) => left, (right) => right);
  }

  updatStatus(String id, String status) async {
    var response = await c.getdata(restStatusBooking,
        {"id_booking": id.toString(), "status": status.toString()});
    return response.fold((left) => left, (right) => right);
  }

  getInfoUserDashboard(String idHotel) async {
    var response =
        await c.getdata(getinformDash, {"id_booking": idHotel.toString()});
    return response.fold((left) => left, (right) => right);
  }

  getHotels() async {
    var reponse = await c
        .getdata(getHotelss, {"user": shardp!.getString("id").toString()});
    return reponse.fold((left) => left, (right) => right);
  }

  addHotel(
    String name,
    String desc,
    String phone,
    String rating,
    String images,
    String longitude,
    String largitude,
    String ville,
    String email,
    String facility,
    String user,
    String price,
  ) async {
    var reponse = await c.getdata(addHotele, {
      "name_Hotel": name,
      "description_Hotel": desc,
      "phone_Hotel": phone,
      "rating_Hotel": rating,
      "images_Hotel": images,
      "longutude": longitude,
      "largitude": largitude,
      "ville": "safi",
      "price": price,
      "email_Hotel": email,
      "Facility_Hotel": facility,
      "user": "88",
    });
    return reponse.fold((left) => left, (right) => right);
  }

  getConcierge() async {
    var reponse = await c
        .getdata(getconcierge, {"id": shardp!.getString("id").toString()});
    return reponse.fold((left) => left, (right) => right);
  }

  addconcierge(String name, String email, String phone, String password) async {
    var reponse = await c.getdata(addConcierge, {
      "username_user": name,
      "email_user": email,
      "phone_user": phone,
      "password": password
    });
    return reponse.fold((left) => left, (right) => right);
  }
}
