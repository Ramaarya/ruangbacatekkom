import 'package:flutter/material.dart';
import '../../../constant.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({
    super.key,
    required this.widthScreenPadding,
    required this.textController,
    required this.textInputType,
    required this.obsecureText,
    required this.hintLabel,
  });

  final double widthScreenPadding;
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool obsecureText;

  final String hintLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      width: widthScreenPadding,
      height: 40,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 220, 220),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: TextField(
        controller: textController,
        keyboardType: textInputType,
        obscureText: obsecureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintLabel,
        ),
      ),
    );
  }
}
