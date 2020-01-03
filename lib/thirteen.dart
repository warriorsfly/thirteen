import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:thirteen/data/model/discover_model.dart';
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
  bool _login = false;

  /// 通知列表
  List notifycations = [];

  //TODO: 添加主题
  //TODO: 添加用户信息

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThirteenAppModel()),
        ChangeNotifierProvider(create: (_) => DiscoverModel()),
      ],
      child: CupertinoApp(
        title: '十三',
        theme: Themes.light,
        initialRoute: '/',
        routes: {
          '/': (_) => ThirteenPage(),
        },
      ),
    );
  }
}
