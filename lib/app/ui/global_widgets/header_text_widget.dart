import 'package:anime_xperience/app/ui/theme/color_const.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String headerText;
  final String buttonText;
  final Function() onPressed;
  const HeaderTextWidget(
      {super.key,
      required this.headerText,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            color: headerTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: headerTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
