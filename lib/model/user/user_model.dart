class UserModel {
  String email;
  String username;
  String password;
  String publicId;

  UserModel({this.email, this.username, this.password, this.publicId});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    publicId = json['public_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['public_id'] = this.publicId;
    return data;
  }
}
