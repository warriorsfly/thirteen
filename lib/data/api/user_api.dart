import 'package:thirteen/data/api/api.dart';

import 'package:http/http.dart' as http;

abstract class UserApi {
  /// 手机登陆Api
  static const String _PHONE_LOGIN_URL = '${API.END_POINT}/login/cellphone';

  static Future<http.Response> login(String phone, String password) async {
    return await http.get('$_PHONE_LOGIN_URL?/phone=$phone&password=$password');
  }

  /// 刷新登陆
  static const String _REFRESH_LOGIN_URL = '${API.END_POINT}/login/refresh';
  static Future<http.Response> refreshToken() async {
    return await http.get('$_REFRESH_LOGIN_URL');
  }

  /// 登陆状态
  static const String _LOGIN_STATUS_URL = '${API.END_POINT}/login/status';
  static Future<http.Response> getLoginStatus() async {
    return await http.get('$_LOGIN_STATUS_URL');
  }

  /// 发送验证码 d
  static const String _SEND_CODE_URL = '${API.END_POINT}/captcha/sent?phone=';
  static Future<http.Response> sendCode(String phone) async {
    return await http.get('$_SEND_CODE_URL$phone');
  }

  /// 验证验证码
  static const String _VERIFY_CODE_URL =
      '${API.END_POINT}/captcha/verify?phone=';
  static Future<http.Response> verify(String phone, String password) async {
    return await http.get('$_VERIFY_CODE_URL$phone&password=$password');
  }
}
