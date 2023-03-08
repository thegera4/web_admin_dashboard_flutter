import 'package:get/get.dart';
import '../constants/constants.dart';

final connect = GetConnect();

Future userSignup(String username, String email, String password) async {
  try {
    var result = await connect.post(
      '${Constants.localHost}/signup',
      {
        'username': username, 
        'email': email, 
        'password': password,
      },
    );
    return result.body;
  } catch (e) {
    return e.toString();
  }
}

Future userLogin(String email, String password) async {
  try {
    var result = await connect.post(
      '${Constants.localHost}/login',
      {
        'email': email, 
        'password': password,
      },
    );
    return result.body;
  } catch (e) {
    return e.toString();
  }
}