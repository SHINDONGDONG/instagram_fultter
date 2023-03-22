
import 'package:flutter/cupertino.dart';
import 'package:instagram_fultter/models/user.dart';
import 'package:instagram_fultter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethos = AuthMethods();
  //사용하지 않을 수 도있다.
  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethos.getUserDetails();
    _user = user;
    notifyListeners();
  }
}