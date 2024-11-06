import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDefaultButton extends StatelessWidget {
  final String data;
  final void Function()? onTap;
  final RxBool? controller;

  const CustomDefaultButton(
      {super.key, required this.data, required this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue
        ),
        width: Get.width,
        height: Get.height * 0.06,
        child: Obx(() {
          return Center(
              child: controller?.value ?? false
                  ? const CupertinoActivityIndicator(color: Colors.white,)
                  : Text(data, style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),));
        }),
      ),
    );
  }
}
