import 'package:kalkulator_zat_besi/shared/package.dart';
import 'package:kalkulator_zat_besi/widget/text_field_dropdown/text_field_dropdown_controller.dart';

// class TextFieldDropdown extends StatelessWidget {
//   TextFieldDropdown({
//     required this.title,
//     required this.listItem,
//   });
//   final List<String> listItem;
//   final String title;
//   final TextFieldDropdownController controller =
//       Get.put(TextFieldDropdownController());
//
//   @override
//   Widget build(BuildContext context) {
//     controller.itemList.value = listItem[0];
//     return Obx(() => DropdownButtonFormField<String>(
//           value: controller.itemList.value,
//           hint: Text(title),
//           items: listItem.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             controller.itemList.value = newValue!;
//           },
//           decoration: InputDecoration(
//             labelText: title,
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//         ));
//   }
// }

import 'package:dropdown_button2/dropdown_button2.dart';

class TextFieldDropdown extends StatelessWidget {
  final Rx<String> selectedValue;
  final List<String> items;
  final String hint;
  final Function(String?) onSaved;

  const TextFieldDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onSaved,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => DropdownButtonFormField2<String>(
      isExpanded: true,
      hint: Text(selectedValue.value == "" ? hint : selectedValue.value),
      iconStyleData: IconStyleData(icon: Icon(Icons.keyboard_arrow_down_rounded)),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0, right: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      items: _addDividersAfterItems(items),
      dropdownStyleData: DropdownStyleData(
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        elevation: 2,
      ),
      onChanged: (String? newValue) {
        selectedValue.value = newValue!;
        onSaved(newValue);
      },
    ));
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    }
    return menuItems;
  }
}
