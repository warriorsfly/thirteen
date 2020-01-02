import 'package:flutter/cupertino.dart';

class PhoneLoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text('未注册手机号登录后将自动创建账号'),
        Column(
          children: <Widget>[
            Text('+86'),
            CupertinoTextField(
              
            )
          ],
        )
      ],
    );

  }
  
}

// class PhoneLoginScreen extends StatefulWidget {
//   @override
//   _PhoneLoginScreenState createState() => _PhoneLoginScreenState();
// }

// class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageRoute(builder: (BuildContext context) {

//     }
      
//     );
//   }
// }