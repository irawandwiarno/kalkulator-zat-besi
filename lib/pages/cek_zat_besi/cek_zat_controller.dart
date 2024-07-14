import 'package:kalkulator_zat_besi/shared/package.dart';

class CekZatController extends GetxController {
  TextEditingController genderController = TextEditingController();
  TextEditingController usiaController = TextEditingController();

  ///berat badan textController
  TextEditingController bbController = TextEditingController();

  ///Tinggi badan textController
  TextEditingController tbController = TextEditingController();
  TextEditingController hbController = TextEditingController();
  Rx<String> valueDropdownGender = "".obs;
  Rx<String> valueDropdownStatus = "".obs;

  var itemGender = ["Pria", "Wanita"];
  var itemStatus = ["Lajang", "Hamil", "Menyusui"];

  void cekButton() {

    if(!validateInputs()){
      print('belum di isi');
      return;
    }

    var gender = valueDropdownGender.value.toLowerCase();
    var status = valueDropdownStatus.value;
    var usia = int.parse(usiaController.text.trim());
    var bb = int.parse(bbController.text.trim());
    var tb = int.parse(tbController.text.trim());
    var hb = int.parse(hbController.text.trim());
    bool pregnant = false;
    bool breastfeeding = false;

    if (status == itemStatus[1]) {
      pregnant = true;
    }else if (status == itemStatus[2]) {
      breastfeeding = true;
    }
    var kebutuhanZatBesi = getIronRequirement(gender, usia, breastfeeding: breastfeeding, pregnant: pregnant);
    if(kebutuhanZatBesi == -1.0){
      print("tidak ketemu");
    }

    print("kebutuhan zat besi : $kebutuhanZatBesi");


  }

  bool validateInputs() {
    if (usiaController.text.isEmpty ||
        bbController.text.isEmpty ||
        tbController.text.isEmpty ||
        hbController.text.isEmpty ||
        valueDropdownGender.value.isEmpty) {
      return false;
    }
    return true;
  }


  Map<String, Map<String, double>> ironRequirements = {
    'pria': {
      '2-5': 11.0,
      '6-11': 14.2,
      '12-19': 15.8,
      '20-29': 15.5,
      '30-39': 16.2,
      '40-49': 16.1,
      '50-59': 16.3,
      '60-69': 16.0,
      '>70': 15.3
    },
    'wanita': {
      '2-5': 9.7,
      '6-11': 13.3,
      '12-19': 12.2,
      '20-29': 12.0,
      '30-39': 12.3,
      '40-49': 11.8,
      '50-59': 12.2,
      '60-69': 11.2,
      '>70': 12.2,
      'wanita hamil': 27.0,
      'menyusui >18 tahun': 9.0,
      'menyusui ≤18': 10.0
    }
  };

  String getAgeGroup(String gender, int age,
      {bool pregnant = false, bool breastfeeding = false}) {
    if (gender == 'wanita' && pregnant) return 'wanita hamil';
    if (gender == 'wanita' && breastfeeding) {
      return age > 18 ? 'menyusui >18 tahun' : 'menyusui ≤18';
    }

    if (age >= 2 && age <= 5) return '2-5';
    if (age >= 6 && age <= 11) return '6-11';
    if (age >= 12 && age <= 19) return '12-19';
    if (age >= 20 && age <= 29) return '20-29';
    if (age >= 30 && age <= 39) return '30-39';
    if (age >= 40 && age <= 49) return '40-49';
    if (age >= 50 && age <= 59) return '50-59';
    if (age >= 60 && age <= 69) return '60-69';
    if (age >= 70) return '>70';

    return '';
  }

  double getIronRequirement(String gender, int age,
      {bool pregnant = false, bool breastfeeding = false}) {
    String ageGroup = getAgeGroup(gender, age,
        pregnant: pregnant, breastfeeding: breastfeeding);
    if (ironRequirements.containsKey(gender)) {
      if (ironRequirements[gender]!.containsKey(ageGroup)) {
        return ironRequirements[gender]![ageGroup]!;
      }
    }
    return -1.0; // Nilai default jika data tidak ditemukan
  }
}
