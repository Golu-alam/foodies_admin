import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/category_controller.dart';
import 'package:foodys_admin/controllers/image_picker_controller.dart';
import 'package:foodys_admin/views/utils/custom_default_button.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddNewCategoryScreen extends StatelessWidget {
  const AddNewCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController = Get.put(ImagePickerController());
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Category"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  imagePickerController.pickCategoryImage(source: ImageSource.gallery);
                },
                child: Obx(() {
                  return CircleAvatar(
                    radius: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: imagePickerController.categoryImage.value.isNotEmpty
                          ? Image.file(File(imagePickerController.categoryImage.value.toString()),height: 150,width: 150, fit: BoxFit.cover,)
                          : const Icon(Icons.image)
                    ),
                  );
                }),
              ),
              const SizedBox(height: 50,),
              TextFormField(
                controller: categoryController.categoryNameController.value,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Add New Category"
                ),
              ),
              const SizedBox(height: 30,),
              CustomDefaultButton(
                controller: categoryController.isLoading,
                data: "Add Category",
                onTap: () {categoryController.addCategoryInFirestore();},
              )
            ],
          ),
        ),
      ),
    );
  }
}
