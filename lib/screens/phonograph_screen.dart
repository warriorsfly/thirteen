import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';

class PhonographScreen extends StatefulWidget {
  final Track track;

  const PhonographScreen({Key key, this.track}) : super(key: key);
  @override
  _PhonographScreenState createState() => _PhonographScreenState();
}

class _PhonographScreenState extends State<PhonographScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 24))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 0,
      end: 2 * pi,
    ).animate(controller);
    return CupertinoPageScaffold(
      backgroundColor: Colors.colorPrimaryDark,
      navigationBar: CupertinoNavigationBar(middle: Text(widget.track.name)),
      child: SafeArea(
          top: true,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Center(
                child: AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) => Transform.rotate(
                          angle: animation.value,
                          child: _buildCover(widget.track.al.picUrl),
                        )),
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 170),
                child: Image.asset('assets/images/styli.png'),
              ),
            ],
          )),
    );
  }

  Widget _buildCover(String url) {
    return Container(
      width: 340,
      height: 340,
      // padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
          image: const DecorationImage(
        image: AssetImage('assets/images/disk.png'),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Container(
          width: 214,
          height: 214,
          // margin: EdgeInsets.only(bottom: 170),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(159)),
            child: Image.network(
              url,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
