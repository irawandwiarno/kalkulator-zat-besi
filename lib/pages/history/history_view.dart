import 'package:kalkulator_zat_besi/pages/history/history_controller.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';
import 'package:kalkulator_zat_besi/widget/hex_color.dart';
import 'package:kalkulator_zat_besi/widget/stick_bar/stick_bar.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BannerAndDate(),
              Gap.h10(),
              BoxTitlePink(),
              Gap.h10(),
              KurangZatBesi(),
              Gap.h10(),
              BoxStickBar(),
              Gap.h20(),
              BoxTextGrey(),
              Obx(() => Column(
                    children: controller.listWidgetFoodConsume.value,
                  )),
              GestureDetector(
                onTap: () => Get.toNamed(RouteName.search),
                child: Container(
                  width: Get.width,
                  height: 70,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    gradient: MyColors.primaryGradien,
                  ),
                  child: Image.asset(
                    "assets/images/plus_button.png",
                  ),
                ),
              ),
              Gap.h(30),
              BoxDirectExel(),
              Gap.h(70),
            ],
          ),
        ),
      )),
    );
  }

  Container BoxTextGrey() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 25),
      color: HexColor.code("F6F6F6"),
      child: const Center(
        child: Text(
          "Sudah makan apa hari ini?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Container BoxStickBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text(
            "Makanan yang kamu konsumsi untuk memenuhi zat besi hari ini:",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap.h10(),
          Obx(() => StickBar(
              data: controller.converToList(controller.dataKonsumsi),
              max: controller.kebutuhanIron.value)),
        ],
      ),
    );
  }

  Row KurangZatBesi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Image.asset(
          "assets/images/icon_darah.png",
          height: 45,
        ),
        Gap.w10(),
        Obx(
          () => Text(
            "${controller.showKurangZatBesi()}",
            style: MyText.customSize(
                size: 46,
                fontFamily: "Dangrek",
                color: HexColor.code("FF6464")),
          ),
        ),
        Text(
          "mg",
          style: TextStyle(
              color: HexColor.code("784747"),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget BoxTitlePink() {
    return Center(
      child: Container(
        color: HexColor.code("FFB1B1"),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: const Text(
          "zat besi yang masih kamu butuhkan",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget BoxDirectExel() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: HexColor.code("D9D9D9"),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: const Text(
          "Cek daftar makanan dan kandungan zat besi",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget BannerAndDate() {
    return Stack(
      children: <Widget>[
        Image.asset("assets/images/food.png"),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              menuAndDate(),
              DayDateAndZatBesi(),
            ],
          ),
        )
      ],
    );
  }

  Widget DayDateAndZatBesi() {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
              ()=> Text(
                    "${controller.nameDay.value},",
                    style: const TextStyle(
                        height: 0.7,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Obx(
                ()=> Text(
                      "${controller.tanggalLabel.value}",
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                ),
                const Text(
                  "Jumlah Asupan Zat",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  "Besi:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => Text("${controller.totolZatBesi}",
                      style: const TextStyle(
                          height: 0.8,
                          fontSize: 90,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Dangrek")),
                ),
                const Text("mg",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          )
        ],
    );
  }

  Widget menuAndDate() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 30,
            )),
        GestureDetector(
          onTap: () => controller.pickDate(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    controller.labelDT.value,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
                Gap.w10(),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 25,
                  color: Color(0xFF222222),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
