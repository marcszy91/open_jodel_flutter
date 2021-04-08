class LoginResponseModel {
  String status;
  String message;
  String authorization;

  LoginResponseModel({this.status, this.message, this.authorization});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    authorization = json['Authorization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['Authorization'] = this.authorization;
    return data;
  }
}