import 'package:flutter/material.dart';

import 'home_widget/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreenBody(),
    );
  }
}
