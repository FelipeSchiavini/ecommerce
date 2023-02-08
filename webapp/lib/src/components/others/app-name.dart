import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double textSize;

  const AppLogo({
    Key? key,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: const [
          TextSpan(
            text: 'in8',
            style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)
          ),
          TextSpan(
            text: '_Shop',
            style: TextStyle(
              color: Colors.black12,
            ),
          ),
        ],
      ),
    );
  }
}