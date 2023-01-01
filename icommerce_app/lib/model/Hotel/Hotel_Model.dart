

class Data_Class_Hotel {
  int? idHotel;
  String? nomHotel;
  String? descriptionHotel;
  String? villeHotel;
  String? emailHotel;
  String? numHotel;

  String? imgHotel;

  String? imgHotel2;
  String? imgHotel3;
  String? imgHotel4;
  int? favorite;
  int? price;
  double? rating;

  Data_Class_Hotel(
      {this.idHotel,
      this.nomHotel,
      this.descriptionHotel,
      this.villeHotel,
      this.emailHotel,
      this.numHotel,
      this.imgHotel,
      this.imgHotel2,
      this.imgHotel3,
      this.imgHotel4,
      this.favorite,
      this.price,
      this.rating});

  Data_Class_Hotel.fromJson(Map<String, dynamic> json) {
    idHotel = json['id_Hotel'];
    nomHotel = json['nom_Hotel'];
    descriptionHotel = json['description_Hotel'];
    villeHotel = json['ville_Hotel'];
    emailHotel = json['email_hotel'];
    numHotel = json['num_Hotel'];
    imgHotel = json['img_Hotel'];
    imgHotel2 = json['img_Hotel2'];
    imgHotel3 = json['img_Hotel3'];
    imgHotel4 = json['img_Hotel4'];
    favorite = json['favorite'];
    price = json['price'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_Hotel'] = idHotel;
    data['nom_Hotel'] = nomHotel;
    data['description_Hotel'] = descriptionHotel;
    data['ville_Hotel'] = villeHotel;
    data['email_hotel'] = emailHotel;
    data['num_Hotel'] = numHotel;
    data['img_Hotel'] = imgHotel;
    data['favorite'] = favorite;
    return data;
  }
}
