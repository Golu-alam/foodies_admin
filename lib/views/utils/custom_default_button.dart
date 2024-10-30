import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/image_slider_controller.dart';
import 'package:get/get.dart';

class CustomDefaultButton extends StatelessWidget {
  final String data;
  final void Function()? onTap;

  const CustomDefaultButton({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ImageSliderController imageSliderController = Get.put(ImageSliderController());
    return Obx(() {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue
          ),
          width: Get.width,
          height: Get.height * 0.06,
          child: Center(
              child: imageSliderController.isLoading.value
                  ? const CupertinoActivityIndicator(color: Colors.white,)
                  : Text(data, style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),)),
        ),
      );
    });
  }
}
