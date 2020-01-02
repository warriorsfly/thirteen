import 'package:flutter/cupertino.dart';

import 'package:thirteen/screens/login.dart';

class MineScreen extends StatefulWidget {
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(
        child: Text("Login"), onPressed: () {
          Navigator.of(context).push<void>(
            CupertinoPageRoute(
              builder: (context)=>LoginScreen(),
              title: 'Login'
            )
          );
        },
      ),
    );
  }
}