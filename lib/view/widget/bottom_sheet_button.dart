import 'package:flutter/material.dart';

InkWell bottomSheetButton(IconData icon, String title,
    {VoidCallback? onPress}) {
  return InkWell(
    onTap: onPress ?? () {},
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[600],
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        Text(title)
      ],
    ),
  );
}
