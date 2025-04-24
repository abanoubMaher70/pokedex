import 'dart:developer';

import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_vert_outlined, size: 28, color: Colors.black),
      onSelected: (String result) {
        log('Selected: $result');
      },
      itemBuilder:
          (BuildContext context) => [
            const PopupMenuItem<String>(value: 'Remove', child: Text('Remove')),
            const PopupMenuItem<String>(
              value: 'Default',
              child: Text('Make Default'),
            ),
          ],
    );
  }
}
