import 'package:challenge_tractian_app/app/asset/asset_controller.dart';
import 'package:challenge_tractian_app/providers.dart';
import 'package:flutter/material.dart';

class CustomButtonHeader extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  final VoidCallback onPressed;
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
            border: Border.all(
                color: isActive ? Colors.blue : const Color(0xFF77818C)),
          ),
          child: Row(
            children: [
              Image.asset(iconPath,
                  color: isActive ? Colors.blue : const Color(0xFF77818C)),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                maxLines: 1,
                style: TextStyle(
                  color: isActive ? Colors.blue : const Color(0xFF77818C),
                  fontSize: 14,
                ),
              )
            ],
          )),
    );

    OutlinedButton.icon(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
        side: WidgetStateProperty.all(
          BorderSide(color: isActive ? Colors.blue : const Color(0xFF77818C)),
        ),
      ),
      icon: Image.asset(iconPath,
          color: isActive ? Colors.blue : const Color(0xFF77818C)),
      label: Text(
        label,
        maxLines: 1,
        style: TextStyle(
          color: isActive ? Colors.blue : const Color(0xFF77818C),
          fontSize: 14,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
