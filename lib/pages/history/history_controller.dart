import 'package:indonesia/indonesia.dart';
import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/models/konsumsi_model.dart';
import 'package:kalkulator_zat_besi/pages/home/home_controller.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/service/database/database_helper.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/hex_color.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class HistoryController extends GetxController {
  RxList<Widget> listWidgetFoodConsume = <Widget>[].obs;
  HomeController homeController = Get.find<HomeController>();
  var dataKonsumsi = [].obs;
  RxDouble kebutuhanIron = 0.0.obs;
  DateTime now = DateTime.now();
  List<DateTime?> selectDate = [DateTime.now()];
  Rx<DateTime> curentDate = DateTime.now().obs;
  RxString totolZatBesi = "".obs;

  final dbHelper = DatabaseHelper.instance;
  Konsumsi? konsumHariIni;

  var labelDT = "".obs;
  var nameDay = "".obs;
  var tanggalLabel = "".obs;


  @override
  void onInit() async {
    kebutuhanIron.value = await Preferences().getZatBesi();
    if (kebutuhanIron.value == 0.0) {
      Get.offNamed(RouteName.cek);
      // return;
    }

    extrakDateTime(curentDate.value);

    konsumHariIni = await dbHelper.getAllByDate(now);
    if (konsumHariIni != null) {
      dataKonsumsi.addAll(konsumHariIni!.dataKonsumsi);

    }
    initConsumIfNull();
    listWidgetFoodConsume.clear();
    for (var data in dataKonsumsi) {
      listWidgetFoodConsume.add(creadeWidgetContainer(data: data));
    }
    showTotalZatBesi();
    ever(dataKonsumsi, (_) {
      buildListMakanan();
      showTotalZatBesi();
    });

    ever(curentDate, (_) {
      reBuildPage();
    });
    super.onInit();
  }

  void buildListMakanan(){
    listWidgetFoodConsume.clear();
    for (var data in dataKonsumsi) {
      listWidgetFoodConsume.add(creadeWidgetContainer(data: data));
    }
  }

  void reBuildPage() async {
    konsumHariIni = null;
    dataKonsumsi.clear();
    extrakDateTime(curentDate.value);
    konsumHariIni = await dbHelper.getAllByDate(curentDate.value);
    initConsumIfNull();
    if (konsumHariIni != null) {
      dataKonsumsi.addAll(konsumHariIni!.dataKonsumsi);

    }
    buildListMakanan();
  }

  void extrakDateTime(DateTime dt) {
    labelDT.value = DateFormat('dd/MM/yyyy').format(dt);
    nameDay.value = convertWeekdayToIndo(DateFormat('EEEE').format(dt));
    tanggalLabel.value = tanggal(dt);
  }

  String convertWeekdayToIndo(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return 'Senin';
      case 'tuesday':
        return 'Selasa';
      case 'wednesday':
        return 'Rabu';
      case 'thursday':
        return 'Kamis';
      case 'friday':
        return 'Jumat';
      case 'saturday':
        return 'Sabtu';
      case 'sunday':
        return 'Minggu';
      default:
        return 'Hari tidak diketahui';
    }
  }

  void initConsumIfNull() async {
    if (konsumHariIni == null) {
      var newKonsum = Konsumsi(
          date: curentDate.value,
          dataKonsumsi: dataKonsumsi,
          kebutuhanIron: kebutuhanIron.value);

      dbHelper.insert(newKonsum);
      konsumHariIni = await dbHelper.getAllByDate(curentDate.value);
    }
  }

  List<Map<String, dynamic>> converToList(RxList<dynamic> data) {
    return data.map((item) {
      return {
        'name': item['name'],
        'zat_besi': item['jumlah_iron'],
      };
    }).toList();
  }

  void addMakanan({required String name, required double beratKonsumsi}) async {
    initConsumIfNull();
    var dataMakanan = getDataMakananWithName(
        dataIndex: homeController.dataIndexMakanan,
        dataMakanan: homeController.dataMakanan,
        namaMakanan: name);
    double hasil = hitungZatBesi(
        beratKonsumsi, (dataMakanan['kandungan_100gr'] as num).toDouble());

    dataKonsumsi.add({
      'name': name,
      'berat_konsumsi': beratKonsumsi,
      'jumlah_iron': hasil,
    });

    Konsumsi konsumsiNew = Konsumsi(
        date: curentDate.value,
        dataKonsumsi: dataKonsumsi,
        kebutuhanIron: kebutuhanIron.value);

    dbHelper.updateByDate(konsumsiNew);
    konsumHariIni = await dbHelper.getAllByDate(curentDate.value);
  }

  double hitungZatBesi(double beratMakanan, double zatBesiPer100Gr) {
    // Menghitung zat besi berdasarkan berat makanan
    return (beratMakanan / 100) * zatBesiPer100Gr;
  }

  double totalJumlahIron() {
    return dataKonsumsi.value.fold(
        0.0, (sum, item) => sum + (item['jumlah_iron'] as num).toDouble());
  }

  double kekuranganZatBesiHariIni() {
    var jumIr = totalJumlahIron();
    var kebIr =  kebutuhanIron.value;
    return kebIr - jumIr;
  }

  getIndexMakanan({required data, required String namaMakanan}) {
    return data[namaMakanan] - 1;
  }

  void showTotalZatBesi() {
    var total = formatDouble(totalJumlahIron());
    String displayName = total.length > 4 ? '${total.substring(0, 4)}' : total;
    if (displayName.endsWith(",")) {
      displayName.replaceAll(",", "");
    }
    totolZatBesi.value = displayName;
  }

  String showKurangZatBesi() {
    double nilai =
        kekuranganZatBesiHariIni() < 0 ? 0 : kekuranganZatBesiHariIni();
    var kurang = formatDouble(nilai);

    return kurang;
  }

  Map<String, dynamic> getDataMakananWithName(
      {required dataIndex, required dataMakanan, required String namaMakanan}) {
    var indexMakanan = dataIndex[namaMakanan.replaceAll(",", "")] - 1;
    return dataMakanan[indexMakanan];
  }

  String formatLongString({required String value, required int batas}) {
    String displayName =
        value.length > batas ? '${value.substring(0, batas)}...' : value;
    return displayName;
  }

  Widget creadeWidgetContainer({
    required Map<String, dynamic> data,
  }) {
    var dataMakanan = getDataMakananWithName(
        dataIndex: homeController.dataIndexMakanan,
        dataMakanan: homeController.dataMakanan,
        namaMakanan: data["name"]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: HexColor.code("D9D9D9"),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${formatLongString(value: data['name'], batas: 15)}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Text("${dataMakanan['kandungan_100gr']}mg zat besi/100gr",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: HexColor.code("6E6E6E"))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${formatDouble(data["berat_konsumsi"])}gr",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
              Text("${formatDouble(data['jumlah_iron'])} mg zat besi",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  String formatDouble(double value) {
    String formattedValue = value.toStringAsFixed(2);

    // Hilangkan angka nol di belakang koma jika tidak diperlukan
    if (formattedValue.endsWith('.00')) {
      formattedValue = formattedValue.substring(0, formattedValue.length - 3);
    } else if (formattedValue.endsWith('0')) {
      formattedValue = formattedValue.substring(0, formattedValue.length - 1);
    }

    return formattedValue.replaceAll('.', ',');
  }

  void pickDate() async {
    var results = await showCalendarDatePicker2Dialog(
      context: Get.context!,
      config: CalendarDatePicker2WithActionButtonsConfig(),
      dialogSize: const Size(325, 400),
      value: selectDate,
      borderRadius: BorderRadius.circular(15),
    );

    if (results!.isNotEmpty && results.first != curentDate.value) {
      selectDate = results;
      curentDate.value = results.first!;
    }
  }
}
