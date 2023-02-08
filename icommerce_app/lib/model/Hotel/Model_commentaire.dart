class Commentaire_Model {
  int? idCommentaire;
  String? textCommentaire;
  int? idHotel;
  int? udUser;
  String? dateCommentaire;
  String? usernameUser;
  String? img;

  Commentaire_Model(
      {this.idCommentaire,
      this.textCommentaire,
      this.idHotel,
      this.udUser,
      this.dateCommentaire,
      this.usernameUser,
      this.img});

  Commentaire_Model.fromJson(Map<String, dynamic> json) {
    idCommentaire = json['id_commentaire'];
    textCommentaire = json['text_commentaire'];
    idHotel = json['id_Hotel'];
    udUser = json['ud_User'];
    dateCommentaire = json['date_commentaire'];
    usernameUser = json['username_user'];
    img = json['img_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_commentaire'] = idCommentaire;
    data['text_commentaire'] = textCommentaire;
    data['id_Hotel'] = idHotel;
    data['ud_User'] = udUser;
    data['date_commentaire'] = dateCommentaire;
    data['username_user'] = usernameUser;
    return data;
  }
}
