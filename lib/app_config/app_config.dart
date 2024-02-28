class AppConfig {
  //dev urls
  static String devUrl = 'https://studyappmw.dev.luminartechnohub.com/api/v1';
  // static String mediadevUrl = 'https://studyappmw.dev.luminartechnohub.com';

  // Final urls
  static String baseUrl = devUrl;

  /// Shared pref Keys
  static const String ACCESS = 'access';
  static const String REFRESH_ACCESS = 'refreshAccess';
  static const String LOCAL = 'local';
  //signIn response data saved to shared pref
  static const String USER_NAME = 'user';
  static const String PASSWORD = 'pass';

  static const String LOGIN_DATA = 'logInData';
}
