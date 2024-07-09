class WaterMarkModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  WaterMarkModel({this.userId, this.id, this.title, this.body});

  factory WaterMarkModel.fromJson(Map<String, dynamic> json) {
    return WaterMarkModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
