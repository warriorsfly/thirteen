import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/album.dart';
import 'package:thirteen/styles.dart';

class AlbumWidget extends StatelessWidget {
  final Album alblum;

  

  const AlbumWidget({Key key, this.alblum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ,
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: 110,
                height: 110,
                child: Image.network(alblum.picUrl),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: Text(
                alblum.name,
                style: Styles.text_title,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
