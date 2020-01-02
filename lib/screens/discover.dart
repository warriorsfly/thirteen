import 'package:flutter/cupertino.dart';

import 'package:thirteen/widgets/banner.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BannerWidget(),
      ],
    );
  }
}
