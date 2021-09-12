import 'package:get/get_navigation/src/root/internacionalization.dart';

class Resx extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello'},
        'hi_IN': {'hello': 'नमस्ते'},
        'ar_AE': {'hello': 'أهلا'},
        'tr_TR': {'hello': 'Salem!'},
        'de_DE': {'hello': 'Hallo'},
      };
}
