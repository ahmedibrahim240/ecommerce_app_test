import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: CustomText(
              text: '-OR-',
              alignment: Alignment.center,
              fontSize: 20,
            ),
          ),
          SocialMediaButton(
            onPressed: () {
              authControllers.faceBookSignInMethod();
            },
            text: "Sign In With Facebook",
            icon: FontAwesomeIcons.facebookSquare,
            iconColor: Colors.blue,
          ),
          SizedBox(height: 20),
          SocialMediaButton(
            onPressed: () {
              authControllers.googleSignInMethod();
            },
            text: "Sign In With Google",
            icon: FontAwesomeIcons.google,
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
