import 'package:kalkulator_zat_besi/pages/history/daftar_makanan.dart';
import 'package:kalkulator_zat_besi/pages/history/history_controller.dart';
import 'package:kalkulator_zat_besi/routes/route_name.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/themes/themes.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';
import 'package:kalkulator_zat_besi/widget/hex_color.dart';
import 'package:kalkulator_zat_besi/widget/stick_bar/stick_bar.dart';
import 'package:sidebarx/sidebarx.dart';

class HistoryView extends GetView<HistoryController> {
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundApp,
      drawer: SidebarX(
        extendedTheme: SidebarXTheme(
          width: 200,
        ),
        footerDivider: Container(
            height: 100,
            child: Center(
                child: Image.asset(
              "assets/images/logo.png",
              width: 100,
            ))),
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: [
          SidebarXItem(
              iconWidget: Padding(
                padding: EdgeInsets.only(
                    right: 5), // Adjust padding values as needed
                child: Icon(Icons.search),
              ),
              label: 'Cek Kebutuhan Zat Besi',
              onTap: () => Get.toNamed(RouteName.cek)),
          SidebarXItem(
              iconWidget: Padding(
                padding: EdgeInsets.only(
                    right: 5), // Adjust padding values as needed
                child: Icon(Icons.library_books_rounded),
              ),
              label: 'Isi Kuisioner',
              onTap: () {
                Get.toNamed(RouteName.kuisioner);
              }),
          SidebarXItem(
              iconWidget: Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.menu_book_rounded),
              ),
              label: 'Baca Artikel',
              onTap: () => Get.toNamed(RouteName.artikel)),
          SidebarXItem(
              iconWidget: Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.home),
              ),
              label: 'Back to Home',
              onTap: () => Get.offAllNamed(RouteName.home)),
        ],
        showToggleButton: false,
      ),
      body: Stack(children: [
        SafeArea(
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
          ),
        ),
        // Container(
        //   height:
        //       double.infinity, // Membuat container yang menutupi seluruh area
        //   width: double.infinity,
        //   color: Colors.white, // Atau warna lain sesuai kebutuhan
        // ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Membuka drawer
                  },
                );
              },
            ),
            titleSpacing: 0,
            backgroundColor: MyColors.transparan, // Warna AppBar
            title: GestureDetector(
              onTap: () => controller.pickDate(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  width: 110,
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
              ),
            ),
          ),
        ),
      ]),
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
    return GestureDetector(
      onTap: (){
        Get.to(DaftarMakanan());
      },
      child: Center(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // menuAndDate(),
              Gap.h(60),
              DayDateAndZatBesi(),
            ],
          ),
        )
      ],
    );
  }

  Widget DayDateAndZatBesi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "${controller.nameDay.value},",
                  style: const TextStyle(
                      height: 0.7,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Obx(
                () => Text(
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
                    style: TextStyle(
                        height: 0.8,
                        fontSize:
                            controller.totolZatBesi.value.length > 3 ? 75 : 90,
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
      ],
    );
  }
}
