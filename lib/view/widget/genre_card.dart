
import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  const GenreCard(
    this.title,
    this.icon,
    this.color, {
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        // height: 100,
        // width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            primary: Colors.black,
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
