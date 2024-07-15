import 'package:kalkulator_zat_besi/pages/cek_zat_besi/cek_zat_controller.dart';
import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/themes/text.dart';
import 'package:kalkulator_zat_besi/widget/PrimaryButton.dart';
import 'package:kalkulator_zat_besi/widget/TextFieldWithSatuan.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';
import 'package:kalkulator_zat_besi/widget/text_field_dropdown/text_field_dropdown.dart';

class CekZatView extends GetView<CekZatController> {
  const CekZatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_circle_left_outlined),
              Text(
                "Kembali",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        leadingWidth: 110,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Gap.h(40),
              Text(
                "Cek Kebutuhan Zat Besi Kamu",
                style: MyText.title(),
              ),
              Gap.h20(),
              TextFieldDropdown(
                selectedValue: controller.valueDropdownGender,
                items: controller.itemGender,
                onSaved: (value) {},
                hint: "Jenis Kelamin",
              ),
              Obx(() => controller.valueDropdownGender == "Wanita"
                  ? Column(
                      children: [
                        Gap.h10(),
                        TextFieldDropdown(
                          selectedValue: controller.valueDropdownStatus,
                          items: controller.itemStatus,
                          onSaved: (value) {},
                          hint: "Status",
                        ),
                      ],
                    )
                  : Container()),
              Gap.h10(),
              TextFieldWithSatuan(
                controller: controller.usiaController,
                title: "Usia",
                satuan: "Tahun",
                isNumber: true,
              ),
              Gap.h10(),
              TextFieldWithSatuan(
                controller: controller.bbController,
                title: "Berat Badan",
                satuan: "Kg",
                isNumber: true,
              ),
              Gap.h10(),
              TextFieldWithSatuan(
                controller: controller.tbController,
                title: "Tinggi Badan",
                satuan: "Cm",
                isNumber: true,
              ),
              Gap.h10(),
              TextFieldWithSatuan(
                controller: controller.hbController,
                title: "Nilai Hb",
                satuan: "Gr/dl.",
                isNumber: true,
              ),
              Gap.h20(),
              PrimaryButton(
                  title: "Cek Sekarang",
                  onPressed: () => controller.cekButton()),
              Gap.h(140),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
