import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_platform/universal_platform.dart';

Future<Map<String, dynamic>> readJsonFile(String fileName) async {
  // Mendapatkan direktori tempat menyimpan file
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = 'assets/$fileName';

  // Membaca file sebagai string
  String jsonString = await rootBundle.loadString(filePath);

  // Mengubah string JSON menjadi Map
  return jsonDecode(jsonString);
}


