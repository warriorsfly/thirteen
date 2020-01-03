import 'package:flutter/cupertino.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 210),
              height: 100,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('assets/images/icon.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              child: CupertinoButton(
                child: Text('using phone'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
