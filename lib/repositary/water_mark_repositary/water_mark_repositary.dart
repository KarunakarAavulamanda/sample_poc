import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:sample_poc/model/water_mark_model/water_mark_model.dart';

class WaterMarkRepositary {
  Future<Map<String, dynamic>> fetchComments() async {
    try {
      final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        List<WaterMarkModel> data = [];
        final List body = response.data;
        body.forEach((e) {
          data.add(WaterMarkModel.fromJson(e));
        });
        return {'data': data, 'timeTaken': 0.0}; // Assuming timeTaken is calculated elsewhere
      }
    } on SocketException {
      throw Exception('Error while fetching data');
    } on TimeoutException {
      throw Exception('Error while fetching data');
    }
    throw Exception('Error while fetching data');
  }
}
