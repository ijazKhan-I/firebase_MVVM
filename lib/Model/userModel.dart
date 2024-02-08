class UserModel {
  String? schoolName;
  String? email;

  UserModel({this.schoolName, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    schoolName = json['schoolName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolName'] = this.schoolName;
    data['email'] = this.email;
    return data;
  }
}