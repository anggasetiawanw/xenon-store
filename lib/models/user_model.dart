class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? username;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.password = '',
    this.username = '',
    this.profilePhotoUrl = '',
    this.token = '',
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
