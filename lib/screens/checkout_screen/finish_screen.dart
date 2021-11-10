import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_fatoorah/my_fatoorah.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final String _test_api_url = 'https://apitest.myfatoorah.com/';
    // ignore: non_constant_identifier_names
    final String _test_api_token =
        'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL';
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
        leading: IconButton(
          onPressed: () {
            checkoutController.pageIndex.value = 2;
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        children: [
          _PaymentNotes(),
          Expanded(
            child: MyFatoorah(
              // ignore: deprecated_member_use
              request: MyfatoorahRequest(
                url: _test_api_url,
                token: _test_api_token,
                currencyIso: Country.SaudiArabia,
                successUrl:
                    "https://assets.materialup.com/uploads/473ef52c-8b96-46f7-9771-cac4b112ae28/preview.png",
                errorUrl:
                    "https://www.digitalpaymentguru.com/wp-content/uploads/2019/08/Transaction-Failed.png",
                invoiceAmount: cartContllors.totalPrice.value,
                language: ApiLanguage.English,
              ),
              errorChild: Center(
                child: Icon(
                  Icons.error,
                  color: Colors.redAccent,
                  size: 50,
                ),
              ),
              succcessChild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done_all,
                      color: Colors.greenAccent,
                      size: 50,
                    ),
                  ],
                ),
              ),
              onResult: (PaymentResponse res) {
                print("res.status:${res.status}");
                if (res.status == PaymentStatus.Success) {
                  showSuccessDialog();
                } else {
                  showFailedDialog();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentNotes extends StatelessWidget {
  const _PaymentNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Notes:',
          fontSize: 18,
          color: Colors.redAccent,
          alignment: Alignment.centerLeft,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Applicantion in test mode',
                fontSize: 13,
                color: Colors.grey.shade400,
                alignment: Alignment.centerLeft,
              ),
              CustomText(
                text: 'Test Card: Visa/Master',
                fontSize: 13,
                color: Colors.grey.shade400,
                alignment: Alignment.centerLeft,
              ),
              CustomText(
                text: 'Card Number: 5123450000000008',
                fontSize: 13,
                color: Colors.grey.shade400,
                alignment: Alignment.centerLeft,
              ),
              CustomText(
                text: 'Expiry Date: Any ex(02/25)',
                fontSize: 13,
                color: Colors.grey.shade400,
                alignment: Alignment.centerLeft,
              ),
              CustomText(
                text: 'CVCr: 5Any ex(123)',
                fontSize: 13,
                color: Colors.grey.shade400,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
