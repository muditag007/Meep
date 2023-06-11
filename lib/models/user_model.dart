class UserModel {
  final int id;
  final String email;
  final String name;
  final String photo;
  UserModel({
    required this.email,
    required this.id,
    required this.name,
    required this.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

class User {
  String? sId;
  String? name;
  String? image;
  String? email;
  List<dynamic>? teams;
  bool? isHost;
  Token? token;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.image,
      this.email,
      this.teams,
      this.isHost,
      this.token,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    if (json['teams'] != null) {
      teams = <dynamic>[];
      teams = json['teams'];
    }
    isHost = json['isHost'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    if (this.teams != null) {
      data['teams'] = this.teams!.toList();
    }
    data['isHost'] = this.isHost;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Token {
  String? displayName;
  String? photoUrl;
  String? id;
  String? email;
  String? serverAuthCode;

  Token(
      {this.displayName,
      this.photoUrl,
      this.id,
      this.email,
      this.serverAuthCode});

  Token.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
    id = json['id'];
    email = json['email'];
    serverAuthCode = json['serverAuthCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['photoUrl'] = this.photoUrl;
    data['id'] = this.id;
    data['email'] = this.email;
    data['serverAuthCode'] = this.serverAuthCode;
    return data;
  }
}
