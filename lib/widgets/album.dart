import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';

class AlbumWidget extends StatelessWidget {

  final Album alblum;

  const AlbumWidget({Key key, this.alblum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: <Widget>[
          Container(
            width: 110,
            height: 110,
            child: Image.network(alblum.picUrl),
          ),
          Text(alblum.name),
        ],
      ),
    );
  }
}