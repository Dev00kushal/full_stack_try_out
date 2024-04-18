import 'package:blog_application/repository/auth_repo.dart';
import 'package:blog_application/utils/utils.dart';
import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      Utils.toastmessage("A email has been send to ${data['email']}");
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utils.toastmessage(error.toString());
    });
  }
}
