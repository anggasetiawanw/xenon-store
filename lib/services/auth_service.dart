import 'dart:convert';

import 'package:xenon_store/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      /*
      List<UserModel> users = data((e) {
        return UserModel.fromJson(data['user'] as Map<String, dynamic>);
      }).toList();
       return users;
        */
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      print("Gagal di AuthService: Gagal Register");
      throw ('Gagal Register');
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      /*
      List<UserModel> users = data((e) {
        return UserModel.fromJson(data['user']);
      }).toList();
      return users;
      */
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['token'];
      return user;
    } else {
      print("Gagal di AuthService: Gagal Login");
      throw ('Gagal Login');
    }
  }
}
