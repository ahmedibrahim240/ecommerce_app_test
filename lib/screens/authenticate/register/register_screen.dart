import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/controllers/auth_controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AccountController> {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            defaultSize,
            defaultSize * 2,
            defaultSize,
            defaultSize * 2,
          ),
          shrinkWrap: true,
          children: [
            Card(
              elevation: 2,
              shape: controller.darkMode.value
                  ? RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(.5),
                        width: 1,
                      ),
                    )
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultSize,
                  vertical: defaultSize * 3,
                ),
                decoration: BoxDecoration(
                  color:
                      controller.darkMode.value ? Colors.black45 : Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: _RegisterFrom(fromKey: fromKey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterFrom extends GetWidget<AuthControllers> {
  const _RegisterFrom({
    Key? key,
    required this.fromKey,
  }) : super(key: key);

  final GlobalKey<FormState> fromKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Sign Up',
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            onSaved: (vale) {
              controller.name = vale!;
            },
            lable: 'Name',
            validator: (vale) => vale!.isEmpty ? "Name Required " : null,
            hintText: 'Ahmed Kahraba',
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            onSaved: (vale) {
              controller.email = vale!;
            },
            lable: 'Email',
            validator: (vale) => vale!.isEmpty ? "Email Required " : null,
            hintText: 'iamdavid@gmail.com',
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            lable: 'Password',
            validator: (vale) => vale!.isEmpty ? "Password Required " : null,
            hintText: '********',
            obscureText: true,
            onSaved: (vale) {
              controller.password = vale!;
            },
          ),
          const SizedBox(height: 50),
          CustomButtom(
            bgColor: kPrimaryColor,
            child: CustomText(
              text: 'SIGN UP',
              alignment: Alignment.center,
              color: Colors.white,
            ),
            onPreessed: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();
                controller.signUpWithEmailAndPawwrod();
              }
            },
          ),
        ],
      ),
    );
  }
}
