import 'package:flutter/material.dart';

Future<void> videoAddDialog(BuildContext context, Size size) {
  return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height / 3,
          constraints: const BoxConstraints(maxHeight: 300),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '作成',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                _addVideoButton(Icons.upload, '動画のアップロード'),
                _addVideoButton(Icons.live_tv, 'ショート動画を作成'),
                _addVideoButton(Icons.settings_input_antenna, 'ライブ配信を開始'),
              ],
            ),
          ),
        );
      });
}

InkWell _addVideoButton(IconData icon, String title) {
  return InkWell(
    onTap: () {},
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
