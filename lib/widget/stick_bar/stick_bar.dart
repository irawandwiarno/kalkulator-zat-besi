import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/stick_bar/stick_bar_controller.dart';

class StickBar extends StatelessWidget {
  StickBar({required this.data, required this.max, super.key});

  final double max;
  final List<Map<String, Object>> data;
  StickBarController controller = Get.put(StickBarController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = Get.width;
    controller.calculatePercentage(data, max, screenWidth);
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFF3F3F3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ]
      ),
      height: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25), // Menyertakan borderRadius yang sama
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.listContainerItem.length,
          itemBuilder: (context, index) {
            print('${controller.listContainerItem[index]}');
            // print('width : ${controller.listContainerItem[index]}');
            return Container(
              width: controller.listContainerItem[index],
              color: index > 10
                  ? controller.labelColor[index % 10]
                  : controller.labelColor[index],
            );
          },
        ),
      ),
    );
  }
}
