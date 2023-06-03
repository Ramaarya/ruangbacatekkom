import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryIcon extends StatelessWidget {
  CategoryIcon({
    Key? key,
    required this.category,
    required this.colorsBG,
    required this.textColors,
  }) : super(key: key);

  String category;
  Color colorsBG;
  Color textColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.only(right: 10, bottom: 5),
      decoration: BoxDecoration(
        color: colorsBG,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: textColors,
        ),
      ),
    );
  }
}

// const Color.fromRGBO(80, 156, 244, 0.15),