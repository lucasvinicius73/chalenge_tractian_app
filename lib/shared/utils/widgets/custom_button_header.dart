import 'package:flutter/material.dart';

class CustomButtonHeader extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  final VoidCallback onPressed;
  final Color isActiveButtonColor = Colors.blue;
  final Color buttonColor = const Color(0xFF77818C);
  const CustomButtonHeader(
      {super.key,
      required this.label,
      required this.iconPath,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.only(left: 4),
          width: 150,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border:
                Border.all(color: isActive ? isActiveButtonColor : buttonColor),
          ),
          child: Row(
            children: [
              Image.asset(iconPath,
                  color: isActive ? isActiveButtonColor : buttonColor),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  color: isActive ? isActiveButtonColor : buttonColor,
                  fontSize: 14,
                ),
              )
            ],
          )),
    );
  }
}
