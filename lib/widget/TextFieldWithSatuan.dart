import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithSatuan extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String satuan;
  final Function(String)? onChange;
  final isNumber;

  const TextFieldWithSatuan({
    Key? key,
    required this.controller,
    required this.title,
    this.satuan = '',
    this.onChange,
    this.isNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : null,
      inputFormatters: isNumber
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.grey[850]),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          suffixIcon: satuan.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        satuan,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
      onChanged: onChange ?? (value) {},
    );
  }
}
