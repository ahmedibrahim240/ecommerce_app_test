import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/controllers/auth_controllers.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/screens/authenticate/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCard extends GetWidget<AccountController> {
  const LoginCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    return Card(
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: controller.darkMode.value ? Colors.black12 : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: _LoginFrom(
          fromKey: fromKey,
        ),
      ),
    );
  }
}

class _LoginFrom extends GetWidget<AuthControllers> {
  const _LoginFrom({
    Key? key,
    required this.fromKey,
  }) : super(key: key);

  final GlobalKey<FormState> fromKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Welcome,',
                fontSize: 30.0,
              ),
              TextButton(
                onPressed: () => Get.to(
                  RegisterScreen(),
                ),
                child: CustomText(
                  text: 'Sign Up',
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomText(
            text: 'Sign in to Continue',
            color: kGrayColor,
            fontSize: 14,
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            onSaved: (value) {
              controller.email = value;
            },
            validator: (value) => value!.isEmpty ? "email Required" : null,
            textInputType: TextInputType.emailAddress,
            lable: 'Email',
            hintText: 'iamdavid@gmail.com',
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            lable: 'Password',
            hintText: '********',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) => value!.isEmpty ? "Passwrod Required" : null,
            onSaved: (value) {
              controller.password = value;
            },
          ),
          const SizedBox(height: 20),
          CustomText(
            alignment: Alignment.centerRight,
            text: 'Forgot Password?',
            fontSize: 14,
          ),
          SizedBox(height: 20),
          CustomButtom(
            bgColor: kPrimaryColor,
            child: CustomText(
              text: 'SIGN IN',
              alignment: Alignment.center,
              color: Colors.white,
            ),
            onPreessed: () {
              if (fromKey.currentState!.validate()) {
                fromKey.currentState!.save();
                controller.signInWithEmailAndPawwrod();
              }
            },
          ),
        ],
      ),
    );
  }
}
