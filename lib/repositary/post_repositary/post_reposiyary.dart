import 'dart:async';
//import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../model/post_model/post_model.dart';

class PostRepository{
  
  Future<Map<String,dynamic>> fetchPost() async {

    try{
      double duration = 0;
      final startTime = DateTime.now();

      final response = await Dio().get('https://jsonplaceholder.typicode.com/comments').whenComplete((){
        final endTime = DateTime.now();
        duration = (endTime.difference(startTime).inMilliseconds)/1000;
        print('duration: '+duration.toString());
      });

      if(response.statusCode == 200){
        List<PostModel> data = [];
        final List body = response.data;
        // print(body);
        int count = 0;
        body.forEach((e){
          if(count <= 10){
            data.add(
                PostModel(
                  postId: e['postId'],
                  name: e['name'],
                  id: e['id'],
                  email: e['email'],
                  body: e['body'],
                )
            );
          }

          count++;

        });
        return
        {
          'data': data,
          'timeTaken': duration,
        };

      }
    }
    on SocketException{
      print('aa');
      throw Exception('Error while fetching data');
    }
    on TimeoutException{
      print('bb');
      throw Exception('Error while fetching data');
    }
    print('cc');
    throw Exception('Error while fetching data');
  }

  Future<Map<String,dynamic>> fetchWebView() async {

    try{
      final startTime = DateTime.now();
      final response = await Dio().get('http://localhost:8080/todo');
      final endTime = DateTime.now();
      final duration = (endTime.difference(startTime).inMilliseconds)/1000;
      print(duration);
      if(response.statusCode == 200){
        final String htmlString = response.data;

        return
          {
            'data': htmlString,
            'timeTaken': duration,
          };

      }
    }
    on SocketException{
      print('aa');
      throw Exception('Error while fetching data');
    }
    on TimeoutException{
      print('bb');
      throw Exception('Error while fetching data');
    }
    print('cc');
    throw Exception('Error while fetching data');
  }

}