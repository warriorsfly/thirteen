import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:thirteen/data/entity/netease/ad.dart';
import 'package:thirteen/dimen.dart';

class AdWidget extends StatelessWidget {
  final Ad ad;

  const AdWidget({Key key, this.ad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimen.radiusNormal),
        child: CachedNetworkImage(
          imageUrl: ad.imageUrl,
          placeholder: (context, url) => CupertinoActivityIndicator(),
          errorWidget: (context, url, error) => Icon(CupertinoIcons.clear),
        ),
      ),
    );
  }
}
