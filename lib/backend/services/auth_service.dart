import 'dart:convert';
import '../models/user_models.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://ibrangoding.my.id/api';

  Future<UserModel> login({
    required int nim,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var header = {'content-Type': 'application/json'};
    var body = jsonEncode({'nim': nim, 'password': password});

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
