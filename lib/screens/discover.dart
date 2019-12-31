import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/data/entity/banner.dart';
import 'package:thirteen/data/model/discover_model.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DiscoverModel>(context);
    return FutureProvider(
      create: (_) async => provider.findBanners(),
      lazy: true,
      child: CupertinoTabView(
        builder: (BuildContext context) {
          final res = Provider.of<List<BannerEntity>>(context);
          return Stack(
            children: <Widget>[
              Container(
                height: 133,
                padding: EdgeInsets.all(10),
                child: FadeInImage.assetNetwork(
                  image: res[0].imageUrl,
                  placeholder: 'images/banner.png',
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
