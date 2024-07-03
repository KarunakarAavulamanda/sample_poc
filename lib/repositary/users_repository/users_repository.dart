import 'dart:async';
//import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../model/users_model/users_model.dart';

class UsersRepository{

  Future<Map<String,dynamic>> fetchUsers() async {

    try{
      double duration = 0;
      final startTime = DateTime.now();
      final response = await Dio().get('https://jsonplaceholder.typicode.com/users').whenComplete((){
        final endTime = DateTime.now();
        duration = (endTime.difference(startTime).inMilliseconds)/1000;
        print(duration);
      });


      if(response.statusCode == 200){
        List<UsersModel> data = [];
        final List body = response.data;
        // print(body);
        body.forEach((e){
            data.add(
                UsersModel(
                  username: e['username'],
                  name: e['name'],
                  id: e['id'],
                  email: e['email'],
                )
            );
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

}