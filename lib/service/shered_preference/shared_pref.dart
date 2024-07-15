import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setZatBesi(double value) async {
    final prefs = await getPrefs();
    await prefs.setDouble('zatBesi', value);
  }

  Future<double?> getZatBesi() async {
    final prefs = await getPrefs();
    return prefs.getDouble('zatBesi');
  }
}

