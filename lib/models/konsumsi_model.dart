import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

class Konsumsi {
  final String? id;
  final DateTime date;
  final RxList<dynamic> dataKonsumsi; // Menggunakan RxList<dynamic>
  final double kebutuhanIron;

  Konsumsi({
    this.id,
    required this.date,
    required this.dataKonsumsi,
    required this.kebutuhanIron,
  });

  Map<String, dynamic> toMap() {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return {
      'date': dateFormat.format(date),
      'dataKonsumsi': jsonEncode(dataKonsumsi.map((e) => e).toList()), // Convert RxList to List
      'kebutuhanIron': kebutuhanIron,
    };
  }

  static Konsumsi fromMap(Map<String, dynamic> map) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return Konsumsi(
      id: map['id'],
      date: dateFormat.parse(map['date']),
      dataKonsumsi: RxList(jsonDecode(map['dataKonsumsi'].toString()).map((e) => e).toList()), // Convert List to RxList
      kebutuhanIron: map['kebutuhanIron'].toDouble(),
    );
  }
}
