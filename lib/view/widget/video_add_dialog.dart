import 'package:appbar_custom/view/widget/bottom_sheet_button.dart';
import 'package:flutter/material.dart';

Future<void> showBottomSheetDialog(
  BuildContext context, {
  required Widget titleBar,
  required List<Widget> items,
}) {
  final ScrollController controller = ScrollController();

  final size = MediaQuery.of(context).size;
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
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: titleBar),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  key: const Key('device_access'),
                  child: Column(children: items),
                ),
              ),
            ],
          ),
        );
      });
}
