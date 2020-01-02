import 'package:flutter/cupertino.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/icon.png'),
        CupertinoButton(
          child: Text('手机号登陆'),
          onPressed: () {},
        ),
      ],
    );
  }
}
