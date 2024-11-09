import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/image_picker_controller.dart';
import 'package:get/get.dart';
import '../../../controllers/image_slider_controller.dart';
import '../../utils/custom_default_button.dart';

class UploadSliderImageScreen extends StatelessWidget {
  const UploadSliderImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    ImageSliderController imageSliderController = Get.put(ImageSliderController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add Slider Image"),),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(()=> GestureDetector(
                  onTap: (){
                    imagePickerController.pickImage(imagePath: imageSliderController.imagePath);
                  },
                  child: CircleAvatar(
                    radius: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                        child: imageSliderController.imagePath.value != null && imageSliderController.imagePath.value.isNotEmpty
                        ? Image.file(File(imageSliderController.imagePath.value),width: 150,height: 150,fit: BoxFit.cover,)
                        : const Icon(Icons.image),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05,),
              // ElevatedButton(onPressed: (){
              //   imageSliderController.addSliderImage();
              // }, child: const Text("Save"))
              CustomDefaultButton(data: 'Save', onTap: () {
                imageSliderController.addSliderImage();

              },controller: imageSliderController.isLoading,)
            ],
          ),
        ),
      ),
    );
  }
}
