import 'package:get/get_navigation/src/root/internacionalization.dart';

class BumacoLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // --Splash/Onboard--
          'hello': 'Hello',
          'message': 'Hi How are you, Welcome to Bumaco!!'
          // --Login/OTP--
          // --Home/Shopping--
          // --Cart/Checkout/Payment--
          // --History/Orders--
        },
        'hi_IN': {
          'hello': 'नमस्ते',
          'message': 'हेलो आप कैसे है, बूमाको में आपका स्वागत है!!'
        },
        'ar_AE': {
          'hello': 'أهلا',
          'message': 'أهلا كيف حالك ، أتمنى لك يومًا رائعًا ، أهلا بك في "بوماكو'
        },
      };
}
