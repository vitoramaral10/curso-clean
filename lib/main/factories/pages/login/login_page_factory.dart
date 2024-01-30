import 'package:flutter/material.dart';

import '../../../../ui/pages/login/login.dart';
import 'login.dart';

Widget makeLoginPage() {
  return LoginPage(makeLoginPresenter());
}
