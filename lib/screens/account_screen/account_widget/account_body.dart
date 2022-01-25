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
        padding: EdgeInsets.only(top: defaultSize * 4, bottom: defaultSize * 2),
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
      padding: EdgeInsets.fromLTRB(
          defaultSize * 2, defaultSize * 6, defaultSize * 2, 0),
      itemBuilder: (context, index) {
        Accountmodels data = accountList[index];
        return GestureDetector(
          onTap: () => accountController.routePages(index),
          child: AccountItemCard(
            data: data,
            index: index,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: defaultSize * 3),
    );
  }
}
