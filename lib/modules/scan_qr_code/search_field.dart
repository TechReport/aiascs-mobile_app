import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  TextFieldWidget({
    this.hint,
    @required this.icon,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: controller,
      padding:
          EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      placeholder: hint,
      placeholderStyle:
          CupertinoTheme.of(context).textTheme.navActionTextStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: CupertinoColors.placeholderText,
                letterSpacing: 1.1,
              ),
      keyboardType: hint.contains("email")
          ? TextInputType.emailAddress
          : TextInputType.text,
      obscureText: hint.contains("password") ? true : false,
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).barBackgroundColor,
        // color: CupertinoColors.extraLightBackgroundGray,
        // backgroundBlendMode: BlendMode.darken,
        borderRadius: BorderRadius.circular(5.0),
      ),
      style: CupertinoTheme.of(context)
          .textTheme
          .actionTextStyle
          .copyWith(letterSpacing: 1.1, fontSize: 20.0),
    );
  }
}