import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/text_styles.dart';
import 'package:pokedex/core/widgets/squer_button.dart';

class CustomTextAppBar extends StatelessWidget {
  const CustomTextAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SquerButton.backButton(context),
        Text(title, style: TextStyles.textStyle20),
        const SizedBox.square(),
      ],
    );
  }
}
