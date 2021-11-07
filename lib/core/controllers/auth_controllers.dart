import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_widget.dart';
import 'package:ecommerce_app/core/services/showLoading.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControllers extends GetxController {
  static AuthControllers instance = Get.find();
  Rx<User?>? firebaseUser;
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;
  String? email, password, name;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);

    firebaseUser!.bindStream(auth.userChanges());

    ever(firebaseUser!, _setInitialScreen);
  }

  //* Sign in whih email add passrod
  void signInWithEmailAndPawwrod() async {
    splachController.isStart.value = false;

    try {
      showLoading();
      await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      dismissLoadingWidget();
    } catch (e) {
      dismissLoadingWidget();
      Get.snackbar(
        "Sign In Failed",
        "Try again\n$e",
        titleText: CustomText(
          text: "Sign In Failed",
          color: kPrimaryColor,
        ),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }

  //* end Sign in whih email add passrod
  //* Sign Up whih email add passrod
  void signUpWithEmailAndPawwrod() async {
    splachController.isStart.value = false;

    try {
      showLoading();

      await auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then(
        (user) async {
          await _addUserToFirestore(user.user!);
        },
      );
    } catch (e) {
      dismissLoadingWidget();
      Get.snackbar(
        "Sign Up Failed",
        "Try again\n$e",
        titleText: CustomText(
          text: "Sign Up Failed",
          color: kPrimaryColor,
        ),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _addUserToFirestore(User user) async {
    UserModel userModel = UserModel(
      id: user.uid,
      name: user.displayName ?? name,
      email: user.email,
      image: user.photoURL ?? "",
    );
    return await firebaseFirestore
        .collection(usersCollection)
        .doc(userModel.id)
        .set(
          userModel.toJson(),
        );
  }

  updateUserData(var user) async {
    return await firebaseFirestore
        .collection(usersCollection)
        .doc(user.value.id)
        .update(
          user.toJson(),
        );
  }
  //* end Sign Up whih email add passrod

  //! google sign in methods
  void googleSignInMethod() async {
    splachController.isStart.value = false;

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    print("googleUser:$googleUser");

    //ToDo: save user login with google in firebase user data
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    showLoading();

    // ignore: unused_local_variable
    final UserCredential? _userCredential =
        await auth.signInWithCredential(credential).then(
      (value) async {
        return await _addUserToFirestore(value.user!);
      },
    );

    //ToDo: END save
  }

  //! end goole sign in nethods
  //? facebook sign in methods
  void faceBookSignInMethod() async {
    splachController.isStart.value = false;

    FacebookLoginResult faceBookUser =
        await facebookLogin.logIn(permissions: [FacebookPermission.email]);
    final accessToken = faceBookUser.accessToken!.token;
    showLoading();
    switch (faceBookUser.status) {
      case FacebookLoginStatus.success:
        //ToDo: save user login with FackBooke in firebase user data

        final faceCredential = FacebookAuthProvider.credential(accessToken);
        // ignore: unused_local_variable
        final UserCredential? _userCredential =
            await auth.signInWithCredential(faceCredential).then(
          (value) async {
            return await _addUserToFirestore(value.user!);
          },
        );

        //ToDo: End save
        break;
      case FacebookLoginStatus.cancel:
        dismissLoadingWidget();
        Get.snackbar(
          "Sign Up Failed",
          "Try again",
          titleText: CustomText(
            text: "Sign Up Failed",
            color: kPrimaryColor,
          ),
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
        );
        break;

      default:
    }

    print("faceBookUser:$faceBookUser");
  }

  void signOut() async {
    name = null;
    email = null;
    password = null;
    splachController.isStart.value = false;
    googleSignIn.signOut();
    auth.signOut();
  }

  //? end facebook sign in methods

  _setInitialScreen(User? user) async {
    if (splachController.isStart.value) {
      await Future.delayed(
        Duration(seconds: 5),
        () {
          _checkUser(user);
        },
      );
    } else {
      _checkUser(user);
    }
  }

  void _checkUser(User? user) async {
    if (user == null) {
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: Authenticate(),
      );
      await MySharedPreferences.saveUserID('null');
      userToken = await MySharedPreferences.getGetuserID();
    } else {
      userModel.bindStream(listenToUser());
      dismissLoadingWidget();
      routeController.routePage(
        type: 'offAll',
        page: CustonNavBar(),
        arguments: 0.obs,
      );
      await MySharedPreferences.saveUserID(user.uid.toString());
      userToken = await MySharedPreferences.getGetuserID();
      addressController.getAllUserAdress();
    }
  }

  Stream<UserModel> listenToUser() {
    return firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser!.value!.uid)
        .snapshots()
        .map(
          (snapshot) => UserModel.fromJson(
            snapshot.data(),
          ),
        );
  }
}
