import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoutubeLogo extends StatelessWidget {
  const YoutubeLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 10, height: 10, color: Colors.white),
            const Icon(
              Icons.smart_display_rounded,
              color: Color(0xFFff0000),
            ),
          ],
        ),
        Flexible(
          child: Text(
            'YouTube',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                  // color: Colors.blue,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
