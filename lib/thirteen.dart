import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/data/entity/user/account.dart';
import 'package:thirteen/data/entity/user/profile.dart';
import 'package:thirteen/data/model/album_model.dart';
import 'package:thirteen/data/model/discover_model.dart';
import 'package:thirteen/data/model/play_list_model.dart';
import 'package:thirteen/screens/thirteen_home.dart';
import 'package:thirteen/themes.dart';
import 'package:thirteen/data/model/thirteen_app_model.dart';

class ThirteenApp extends StatefulWidget {
  @override
  _ThirteenAppState createState() => _ThirteenAppState();
}

class _ThirteenAppState extends State<ThirteenApp> {
  /// 网络连接
  bool connected = false;

  ///用户是否已经登陆
  // bool _login = false;

  /// 通知列表
  List notifycations = [];

  /// 账户信息
  Account account;

  /// 用户信息
  Profile profile;

  /// token
  String token;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThirteenAppModel()),
        ChangeNotifierProvider(create: (_) => DiscoverModel()),
        ChangeNotifierProvider(create: (_) => AlbumModel()),
        Provider(create: (_) => PlayListModel()),
      ],
      child: CupertinoApp(
        title: '十三',
        theme: Themes.light,
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
        },
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<PlayListModel>(context).dispose();
    super.dispose();
  }
}
