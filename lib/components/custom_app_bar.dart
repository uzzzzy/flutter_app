import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 8),
      color: Colors.red,
      child: Row(
        children: const [
          Text(
            'title',
            style: TextStyle(
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
