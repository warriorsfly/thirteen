import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/ad.dart';

class AdWidget extends StatelessWidget {

  final Ad ad;

  const AdWidget({Key key, this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FadeInImage.assetNetwork(
            image: ad.imageUrl,
            placeholder: 'assets/images/banner.png',
          ),
        ),
      ),
    );
  }
}
