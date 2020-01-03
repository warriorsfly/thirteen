import 'package:flutter/foundation.dart';

class Account {
  const Account({
    @required this.id,
    @required this.type,
    @required this.status,
    @required this.whitelistAuthority,
    @required this.userName,
    @required this.salt,
    @required this.tokenVersion,
    @required this.ban,
    @required this.baoyueVersion,
    @required this.donateVersion,
    @required this.vipType,
    @required this.viptypeVersion,
    @required this.anonimousUser,
    @required this.createTime,
  });
  final int id;
  final int type;
  final int status;
  final int whitelistAuthority;
  final String userName;
  final String salt;
  final String tokenVersion;
  final int ban;
  final int baoyueVersion;
  final int donateVersion;
  final int vipType;
  final int viptypeVersion;
  final bool anonimousUser;
  final int createTime;
}
