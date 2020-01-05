import 'api.dart';

abstract class LoginApi {
  /// 手机登陆Api
  static const String PHONE_LOGIN_URL = '${API.END_POINT}/login/cellphone';

  /// 刷新登陆
  static const String REFRESH_LOGIN_URL = '${API.END_POINT}/login/refresh';

  /// 登陆状态
  static const String LOGIN_STATUS_URL = '${API.END_POINT}/login/status';

  /// 发送验证码 d
  static const String SEND_CODE_URL = '${API.END_POINT}/captcha/sent';

  /// 验证验证码
  static const String VERIFY_CODE_URL = '${API.END_POINT}/captcha/verify';
}
