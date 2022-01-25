import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/controllers/account_controller.dart';
import 'package:ecommerce_app/core/cutom_widget/custom_text.dart';
import 'package:ecommerce_app/core/cutom_widget/cutom_cached_net_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountAvater extends StatelessWidget {
  const AccountAvater({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                _buildImage(
                  context: context,
                  image: authControllers.usermodels.value.image!,
                ),
                if (authControllers.usermodels.value.image != "") _editImage(),
              ],
            ),
            _accountData(
              name: authControllers.usermodels.value.name ?? '',
              email: authControllers.usermodels.value.email ?? '',
            ),
          ],
        ),
      ),
    );
  }

  _accountData({required String name, required String email}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: name,
          fontSize: 16,
          maxLines: 1,
          fontWeight: FontWeight.bold,
        ),
        Container(
          width: defaultSize * 20,
          child: CustomText(
            text: email,
            fontSize: 14,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  _editImage() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => _eidImageDialog(),
        child: Container(
          height: defaultSize * 4.5,
          width: defaultSize * 4.5,
          padding: EdgeInsets.all(defaultSize),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.cameraswitch,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  _buildImage({
    required BuildContext context,
    required String image,
  }) {
    if (image == '') {
      return GetBuilder<AccountController>(
        builder: (controller) => GestureDetector(
          onTap: () => _eidImageDialog(),
          child: CircleAvatar(
            radius: defaultSize * 5.5,
            backgroundColor:
                controller.darkMode.value ? Colors.black12 : Colors.white,
            child: SizedBox(
              height: defaultSize * 13,
              width: defaultSize * 13,
              child: ClipOval(
                child: Center(
                  child: Icon(
                    Icons.cameraswitch,
                    color: kPrimaryColor,
                    size: defaultSize * 8,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return GetBuilder<AccountController>(
      builder: (controller) => CircleAvatar(
        radius: controller.darkMode.value ? defaultSize * 6 : defaultSize * 5.8,
        backgroundColor: controller.darkMode.value
            ? Colors.grey.withOpacity(.5)
            : Colors.white,
        child: CircleAvatar(
          radius: defaultSize * 5.8,
          backgroundColor:
              controller.darkMode.value ? Colors.black12 : Colors.white,
          child: SizedBox(
            height: defaultSize * 13,
            width: defaultSize * 13,
            child: ClipOval(
              child: CustomCachedNetworkImage(
                context: context,
                url: image,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _eidImageDialog() {
    Get.defaultDialog(
      title: '',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: CustomText(text: "Pick from Gallery", fontSize: 20),
            leading: Icon(
              Icons.image,
              color: kPrimaryColor,
            ),
            onTap: () {
              accountController.loadPicker(ImageSource.gallery);
            },
          ),
          ListTile(
            title: CustomText(text: "Take a pictuer", fontSize: 20),
            leading: Icon(
              Icons.camera,
              color: kPrimaryColor,
            ),
            onTap: () {
              accountController.loadPicker(ImageSource.camera);
            },
          )
        ],
      ),
      barrierDismissible: false,
      textCancel: "Cancel",
      cancelTextColor: kPrimaryColor,
      onCancel: () {
        Get.back();
      },
    );
  }
}
