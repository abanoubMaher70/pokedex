import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pokedex/core/utils/text_styles.dart';

class FilteringButton extends StatelessWidget {
  const FilteringButton({super.key, required this.filterBy});

  final String filterBy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.grey.shade100,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                filterBy,
                style: TextStyles.textStyle12,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(IconlyLight.filter_2, size: 22),
          ],
        ),
      ),
    );
  }
}
