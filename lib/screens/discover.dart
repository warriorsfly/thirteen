import 'package:flutter/cupertino.dart';

import 'package:thirteen/widgets/banner.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          BannerWidget(),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset('assets/image/icon.png'),
                  Text('每日推荐')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
