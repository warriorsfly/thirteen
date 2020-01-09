import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/ad.dart';
import 'package:thirteen/dimen.dart';

class AdWidget extends StatelessWidget {
  final Ad ad;

  const AdWidget({Key key, this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimen.radiusNormal)),
      ),
      height: 200,
      padding: EdgeInsets.all(Dimen.paddingNormal),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimen.radiusNormal),
          child: FadeInImage.assetNetwork(
            image: ad.imageUrl,
            placeholder: 'assets/images/banner.png',
          ),
        ),
      ),
    );
  }
}
