import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/colors.dart';
import 'package:thirteen/data/entity/netease/album_detail.dart';
import 'package:thirteen/data/model/player_model.dart';
import 'package:thirteen/widgets/music_player_controller_widget.dart';

class PhonographScreen extends StatefulWidget {
  final List<Track> tracks;
  final int initalIndex;

  const PhonographScreen({Key key, this.tracks, this.initalIndex})
      : super(key: key);
  @override
  _PhonographScreenState createState() => _PhonographScreenState();
}

class _PhonographScreenState extends State<PhonographScreen>
    with SingleTickerProviderStateMixin {
  int songIndex = -1;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 24))
          ..repeat();
    songIndex = widget.initalIndex;
  }

  @override
  Widget build(BuildContext context) {
    final animation = Tween(
      begin: 0,
      end: 2 * pi,
    ).animate(controller);

    final model = Provider.of<PlayerModel>(context)
      ..playAlbum(widget.tracks, songIndex);
    return CupertinoPageScaffold(
      backgroundColor: Colors.colorPrimaryDark,
      navigationBar:
          CupertinoNavigationBar(middle: Text(widget.tracks[songIndex].name)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Center(
                  child: AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) => Transform.rotate(
                            angle: animation.value,
                            child: _buildVinyl(model.currentOne.al.picUrl),
                          )),
                ),
                Container(
                  child: Image.asset('assets/images/styli.png'),
                ),
              ],
            ),
          ),
          MusicPlayerController(),
        ],
      ),
    );
  }

  ///旋转封面
  Widget _buildVinyl(String url) {
    return Container(
      width: 315,
      height: 315,
      // padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/disk.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          width: 212,
          height: 212,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/vinyl.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(106)),
            child: Image.network(
              url,
              fit: BoxFit.fill,
              // loadingBuilder: (context,widget,),
            ),
          ),
        ),
      ),
    );
  }
}
