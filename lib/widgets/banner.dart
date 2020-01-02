import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/data/entity/banner.dart';
import 'package:thirteen/data/model/discover_model.dart';

class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  Future<List<BannerEntity>> _future;
  @override
  Widget build(BuildContext context) {
    _future = Provider.of<DiscoverModel>(context).findBanners();
    return FutureBuilder<List<BannerEntity>>(
      future: _future,
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return CupertinoActivityIndicator();
          case ConnectionState.done:
            return Container(
              height: 200,
              padding: EdgeInsets.all(10),
              child: Center(
                child: FadeInImage.assetNetwork(
                  image: snap.data[0].imageUrl,
                  placeholder: 'assets/images/banner.png',
                ),
              ),
            );
          default:
            return CupertinoActivityIndicator();
        }
      },
    );
  }
}
