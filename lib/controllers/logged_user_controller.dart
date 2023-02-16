import 'package:get/get.dart';
import '../models/logged_user.dart';

class LoggedUserController extends GetxController {

  final _loggedUser = LoggedUser().obs;

  LoggedUser get loggedUser => _loggedUser.value;

  set loggedUser(LoggedUser value) => _loggedUser.value = value;

}