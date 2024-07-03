class UsersModel {
  String? username;
  int? id;
  String? name;
  String? email;

  UsersModel({this.username, this.id, this.name, this.email, });

  UsersModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  get body => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
