import 'package:flutter/material.dart';

import 'cutom_widget.dart';

class SocialMediaButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  final Color iconColor;
  const SocialMediaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButtom(
      onPreessed: () => onPressed(),
      borderColor: Colors.grey.withOpacity(.5),
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
            color: iconColor,
          ),
          SizedBox(width: 45),
          CustomText(
            text: text,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
