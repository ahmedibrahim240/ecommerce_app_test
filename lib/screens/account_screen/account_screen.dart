import 'package:flutter/material.dart';

import 'account_widget/account_body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountBody(),
    );
  }
}
