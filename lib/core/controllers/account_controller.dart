import 'package:ecommerce_app/core/services/coustm_dialogs.dart';
import 'package:ecommerce_app/screens/account_screen/account_widget/account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  var themeMode = ThemeMode.system.obs;
  final picker = ImagePicker();
  var imageFile;

  Rx<bool> darkMode = false.obs;
  Rx<bool> isSystemMode = false.obs;
  void onReady() async {
    super.onReady();
    darkMode.value = await MySharedPreferences.getisDartMode() ?? false;
    isSystemMode.value = await MySharedPreferences.getiisSystemMode() ?? false;
    if (isSystemMode.value) getThemeMode();
    if (!isSystemMode.value) switchDartMode();
  }

  loadPicker(ImageSource source) async {
    var picked = await picker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked);
    }
    Get.back();
  }

  getThemeMode() async {
    final _brightness = SchedulerBinding.instance!.window.platformBrightness;
    switch (_brightness) {
      case Brightness.dark:
        themeMode.value = ThemeMode.dark;
        darkMode.value = true;
        await MySharedPreferences.saveisDartMode(darkMode.value);
        switchDartMode();
        update();
        break;
      case Brightness.light:
        themeMode.value = ThemeMode.light;
        darkMode.value = false;
        await MySharedPreferences.saveisDartMode(darkMode.value);
        switchDartMode();
        update();
        break;
      default:
        themeMode.value = ThemeMode.light;
        darkMode.value = false;
        await MySharedPreferences.saveisDartMode(darkMode.value);
        switchDartMode();
        update();
    }
  }

  switchDartMode() {
    if (darkMode.value) {
      if (!isSystemMode.value) themeMode.value = ThemeMode.dark;
      update();
      return Get.changeTheme(AppTheme.darkTheme);
    } else {
      if (!isSystemMode.value) themeMode.value = ThemeMode.light;
      update();
      return Get.changeTheme(AppTheme.lightTheme);
    }
  }

  _cropImage(var picked) async {
    var cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: kPrimaryColor,
        toolbarColor: kPrimaryColor,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      imageFile = cropped;
      showLoading();
      await uploadImage();
    }
  }

  uploadImage() async {
    String fileName = basename(imageFile.path);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('user_images/$fileName');
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then((val) async {
      authControllers.updateUserData({'image': val});
      dismissLoadingWidget();
    });
    update();
  }

  routePages(int index) {
    switch (index) {
      case 0:
        routeController.routePage(
          type: 'to',
          page: OrderHistoryPage(),
        );
        break;
      case 1:
        onChangedDarKMode(!darkMode.value);

        break;
      case 2:
        onChangedSystemMode(!isSystemMode.value);

        break;
      case 3:
        authControllers.signOut();

        break;
    }
  }

  onChangedDarKMode(value) async {
    darkMode.value = value;
    if (isSystemMode.value) {
      isSystemMode.value = false;
      await MySharedPreferences.saveisSystemMode(value);
    }

    switchDartMode();
    await MySharedPreferences.saveisDartMode(value);
  }

  onChangedSystemMode(value) async {
    isSystemMode.value = value;
    getThemeMode();
    await MySharedPreferences.saveisSystemMode(value);
  }
}
