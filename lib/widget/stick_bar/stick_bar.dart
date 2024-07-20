import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/gap.dart';
import 'package:kalkulator_zat_besi/widget/hex_color.dart';
import 'package:kalkulator_zat_besi/widget/stick_bar/stick_bar_controller.dart';

class StickBar extends StatelessWidget {
  StickBar({required this.data, required this.max, super.key});

  final double max;
  final List<Map<String, dynamic>> data;
  late StickBarController controller = Get.put(StickBarController());

  @override
  Widget build(BuildContext context) {
    print('data: ${data.toString()}');
    var screenWidth = Get.width;
    controller.calculatePercentage(data, max, screenWidth);
    controller.initLabel(data);
    return Column(
      children: [
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: HexColor.code("F3F3F3"),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ]),
          height: 30,
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(25), // Menyertakan borderRadius yang sama
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listWidgetItem.length,
              itemBuilder: (context, index) {
                return Container(
                  width: controller.listWidgetItem[index],
                  color: index > 10
                      ? controller.labelColor[index % 10]
                      : controller.labelColor[index],
                );
              },
            ),
          ),
        ),
        Gap.h10(),
        SizedBox(
          height: 85,
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 5),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.listItemName.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                // Cek apakah indeks saat ini adalah indeks terakhir
                bool isLastItem = index == controller.listItemName.length - 1;

                // Gunakan warna putih jika ini adalah item terakhir, atau ambil warna dari labelColor jika bukan
                Color colorToUse = isLastItem
                    ? HexColor.code("F3F3F3")
                    : controller
                        .labelColor[index % controller.labelColor.length];
                return SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      colorBox(
                        color: colorToUse,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:
                              titleLabel(title: controller.listItemName[index]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget colorBox({required Color color}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color, // Contoh warna biru
        shape: BoxShape.rectangle,
      ),
    );
  }

  Widget titleLabel({required String title}) {
    return Text(
      controller.formatLongString(value: title, batas: 10),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    );
  }
}
