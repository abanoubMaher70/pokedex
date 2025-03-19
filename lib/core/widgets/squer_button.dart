import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/constant_colors.dart';

class SquerButton extends StatelessWidget {
  const SquerButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    required this.onTap,
  });

  factory SquerButton.backButton(BuildContext context) {
    return SquerButton(
      onTap: () => Navigator.pop(context),
      backgroundColor: ConstantColors.kPrimaryRed,
      iconColor: Colors.white,
      icon: Icons.arrow_back_ios_rounded,
    );
  }

  final Color? backgroundColor, iconColor;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 47,
        height: 47,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 22)),
      ),
    );
  }
}
