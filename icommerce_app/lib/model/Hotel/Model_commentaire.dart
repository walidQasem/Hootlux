class Commentaire_Model {
  int? idCommentaire;
  String? textCommentaire;
  int? idHotel;
  int? udUser;
  String? dateCommentaire;
  String? usernameUser;

  Commentaire_Model(
 
      {this.idCommentaire,
      this.textCommentaire,
      this.idHotel,
      this.udUser,
      this.dateCommentaire,
      this.usernameUser});

  Commentaire_Model.fromJson(Map<String, dynamic> json) {
    idCommentaire = json['id_commentaire'];
    textCommentaire = json['text_commentaire'];
    idHotel = json['id_Hotel'];
    udUser = json['ud_User'];
    dateCommentaire = json['date_commentaire'];
    usernameUser = json['username_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_commentaire'] = this.idCommentaire;
    data['text_commentaire'] = this.textCommentaire;
    data['id_Hotel'] = this.idHotel;
    data['ud_User'] = this.udUser;
    data['date_commentaire'] = this.dateCommentaire;
    data['username_user'] = this.usernameUser;
    return data;
  }
}