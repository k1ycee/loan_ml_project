import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    try {
      pref = await SharedPreferences.getInstance();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static setEligibilityValue(int value) async {
    await pref.setInt('eligibility', value);
  }

  static int  getEligibilityValue() {
    return pref.getInt('eligibility') ?? 0;
  }

  static setOnBoardingStatus(bool value) async {
    await pref.setBool('onboard', value);
  }

  static bool getOnBoardingStatus() {
   return pref.getBool('onboard') ?? false;
  }
}
