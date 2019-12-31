

abstract class LoginApi {

  /// 手机登陆Api
  static const String PHONE_LOGIN_URL = '/login/cellphone';

  /// 刷新登陆
  static const String REFRESH_LOGIN_URL = '/login/refresh';

  /// 发送验证码 d
  static const String SEND_CODE_URL = '/captcha/sent';

  /// 验证验证码
  static const String VERIFY_CODE_URL = '/captcha/verify';
}
