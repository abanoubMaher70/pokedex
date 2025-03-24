import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/squer_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.titleColor,
  });

  final String title;
  final Color? titleColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SquerButton.backButton(context),
        Text(title, style: TextStyles.textStyle14.copyWith(color: titleColor)),
        leading ?? const SizedBox(width: 47, height: 47),
      ],
    );
  }
}
