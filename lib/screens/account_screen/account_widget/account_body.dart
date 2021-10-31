import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

import 'account_widget.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountAvater(),
            Expanded(
              child: _BuildAccountItems(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildAccountItems extends StatelessWidget {
  const _BuildAccountItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: accountList.length,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
      itemBuilder: (context, index) {
        AccountModels data = accountList[index];
        return GestureDetector(
          onTap: () => accountController.routePages(index),
          child: AccountItemCard(
            data: data,
            index: index,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 30),
    );
  }
}
