import 'package:flutter/material.dart';

class UserImages extends StatelessWidget {
  const UserImages({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      foregroundImage: AssetImage(path),
    );
  }
}