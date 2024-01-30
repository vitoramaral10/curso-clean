import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.auth : null,
            child: Text('Entrar'.toUpperCase()),
          );
        });
  }
}
