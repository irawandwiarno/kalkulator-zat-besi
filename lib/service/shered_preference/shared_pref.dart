import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setZatBesi(double value) async {
    final prefs = await getPrefs();
    await prefs.setDouble('zatBesi', value);
  }

  Future<double> getZatBesi() async {
    final prefs = await getPrefs();
    return prefs.getDouble('zatBesi') ?? 0.0;
  }

  Future<void> setIsExpired(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isExpired", value);
  }

  Future<bool?> getIsExpired() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isExpired");
  }

  Future<void> setJawabanPertanyaan1(List<Map<String, dynamic>> value) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(value);
    await prefs.setString("pertanyaan1", jsonString);
  }

  Future<List<Map<String, dynamic>>> getJawabanPertanyaan1() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString("pertanyaan1");
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => e as Map<String, dynamic>).toList();
    }
    return [];
  }

  Future<void> setJawabanPertanyaan2(List<Map<String, dynamic>> value) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(value);
    await prefs.setString("pertanyaan2", jsonString);
  }

  Future<List<Map<String, dynamic>>> getJawabanPertanyaan2() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString("pertanyaan2");
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => e as Map<String, dynamic>).toList();
    }
    return [];
  }
}

