import 'package:intl/intl.dart';
import 'package:kalkulator_zat_besi/pages/home/home_binding.dart';
import 'package:kalkulator_zat_besi/pages/home/home_view.dart';
import 'package:kalkulator_zat_besi/pages/lockscreen/lock.dart';
import 'package:kalkulator_zat_besi/routes/app_page.dart';
import 'package:kalkulator_zat_besi/service/database/database_helper.dart';
import 'package:kalkulator_zat_besi/service/shered_preference/shared_pref.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  // final now = DateTime.now();
  // print('wwww : ${now.add(Duration(days: 3))}');
  runApp(MyApp(isExpied: await isAppExpired()));
}

Future<bool> isAppExpired() async {
  final isExpiredPref = await Preferences().getIsExpired();
  if (isExpiredPref != null && isExpiredPref) return true;

  final now = DateTime.now();
  final stringExpired = "2024-07-23 23:59:36.557943";

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss.SSSSSS');
  final DateTime parsedDate = formatter.parse(stringExpired);
  var result = now.isAfter(parsedDate);

  if(result){
    Preferences().setIsExpired(result);
  }

  return result;
}

class MyApp extends StatelessWidget {
  MyApp({required this.isExpied, super.key});
  final bool isExpied;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(fontFamily: "NunitoSans"),
      home: isExpied ? LockScreen() : HomeView(),
      getPages: AppPages.pages,
      initialBinding:isExpied ? null : HomeBinding(),
    );
  }
}
