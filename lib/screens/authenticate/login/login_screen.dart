import 'package:ecommerce_app/screens/authenticate/auth.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            LoginCard(),
            SocialMediaCard(),
          ],
        ),
      ),
    );
  }
}
