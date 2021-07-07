import 'package:flutter/material.dart';

class DropDownStrip extends StatelessWidget {
  final String dropdownitem;
  final Function onChange;
  final List<String> item;

  DropDownStrip({
    @required this.dropdownitem,
    @required this.onChange,
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Color(0xFF264653)),
          fillColor: Colors.white),
      value: "$dropdownitem",
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      onChanged: this.onChange,
      items: this.item.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}