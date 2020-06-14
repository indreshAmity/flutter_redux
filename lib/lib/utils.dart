import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static void setbackground_red_Pref(_r) async {
    print("Set preference");
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setDouble("red", _r);
  }

  static Future<double> getBackground_red_pref() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    // print("[Future]" + _pref.getDouble("red").toString());
    return _pref.getDouble("red");
  }
}
