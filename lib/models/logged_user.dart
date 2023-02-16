class LoggedUser {
  String? uid;
  String? email;
  String? name;
  String? imageUrl;

  LoggedUser({this.uid, this.email, this.name, this.imageUrl});

  LoggedUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    name = json['name'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    return data;
  }

}