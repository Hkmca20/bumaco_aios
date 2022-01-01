import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String get fileName =>
      kReleaseMode ? "assets/.env.pro" : "assets/.env.dev";
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? 'http://localhost:4000/';
  static String localhost = dotenv.get('LOCALHOST');
  static String apiKey =
      dotenv.get('API_KEY', fallback: dotenv.get('API_KEY0'));
  static String authDomain = dotenv.get('AUTH_DOMAIN');
  static String projectId = dotenv.get('PROJECT_ID');
  static String storageBucket = dotenv.get('STORAGE_BUCKET');
  static String messagingSenderId = dotenv.get('MSG_SENDER_ID');
  static String appId = dotenv.get('APP_ID_W');
  static String appIdA = dotenv.get('APP_ID_A');

  static final username = dotenv.get('USER_NAME', fallback: null);
  static final password = dotenv.get('USER_PASS', fallback: null);

  static final razorpayKey = dotenv.get('RAZORPAY_KEY', fallback: null);
}
