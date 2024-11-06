import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodys_admin/controllers/image_picker_controller.dart';
import 'package:foodys_admin/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> categoryNameController = TextEditingController().obs;
  var allCategory = <CategoryModel>[].obs;
  
  Future<void> addCategoryInFirestore()async{
    isLoading.value = true;
    try{
      CategoryModel categoryModel = CategoryModel(
        categoryName: categoryNameController.value.text,
        createdAt: DateTime.now().toString(),
        updatedAt: "",
        categoryImage: await imagePickerController.imageStoreInStorage(collectionName: "category_images"),
      );
      await _db.collection("category").add(categoryModel.toJson()).then((value) async{
        var id = value.id;
        await _db.collection("category").doc(id).update(
          {
            "id" : id
          }
        );
      },).then((value) {
        Get.back();
      },);

      imagePickerController.categoryImage.value = "";
      categoryNameController.value.clear();
    }catch(e){
      print("Error => $e");
      Get.snackbar("Error", "$e");
    }finally{
      isLoading.value = false;
    }
    
  }

  Future<void> getAllCategories()async{
    isLoading.value = true;
    try{
      _db.collection("category")
          .orderBy("createdAt",descending: true)
          .snapshots()
          .listen((snapshot) => allCategory.value = snapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()),).toList(),);
    }catch(e){
      print("Error =>$e");
      Get.snackbar("Error", "$e");
    }finally{
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }


}