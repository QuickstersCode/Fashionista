import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  IconData icon;
  String title;
  IconData icon_2;

  CustomAppBar(
      {super.key,
      required this.icon,
      required this.title,
      required this.icon_2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        IconButton(onPressed: () {}, icon: Icon(icon_2)),
      ],
    );
  }
}
