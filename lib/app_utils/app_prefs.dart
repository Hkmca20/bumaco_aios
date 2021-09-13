import 'package:shared_preferences/shared_preferences.dart';

class MyPrefHelper {
  void saveTokenSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pref_token', value);
    // prefs.remove("stringValue");//hari remove demo
    //bool CheckValue = prefs.containsKey('value');//hari check pref
  }

  Future<String?> getMobileSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('pref_mobile');
    return token;
  }

  void saveMobileSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pref_mobile', value);
  }

  Future<String?> getTokenSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('pref_token');
    return token;
  }

  setMobileToSF(String mobileNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pref_mobile', mobileNumber);
  }

  Future<String?> getMobileFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('pref_mobile');
    return stringValue;
  }
}
