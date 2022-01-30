import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final Color? bgColor;
  final Color? iconColor;
  final double iconSize;
  const CircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.iconSize,
    this.bgColor,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 5,
          right: 3,
        ),
        child: IconButton(
          onPressed: () => onPressed(),
          icon: Icon(icon),
          iconSize: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
