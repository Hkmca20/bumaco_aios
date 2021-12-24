import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  static String get fileName =>
      kReleaseMode ? "assets/.env.pro" : "assets/.env.dev";
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? 'https://localhost:4000/';
  static String apiKey = dotenv.get('API_KEY',
      fallback: 'AIzaSyBjA5X_1RfRWdjP88Ri3hmLfIp1qyo9F_Y');
  static final username = dotenv.get('USER_NAME', fallback: null);
  static final password = dotenv.get('USER_PASS', fallback: null);

  static final razorpayKey = dotenv.get('RAZORPAY_KEY', fallback: null);
}
