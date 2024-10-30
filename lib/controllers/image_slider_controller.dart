import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodys_admin/controllers/image_picker_controller.dart';
import 'package:foodys_admin/models/slider_image_model.dart';
import 'package:get/get.dart';

class ImageSliderController extends GetxController{
  ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  RxBool isLoading = false.obs;
  RxString imagePath = "".obs;

  Future<void> addSliderImage()async{
    isLoading.value = true;
    try{
      if(imagePath.value.isNotEmpty){
        SliderImageModel sliderImageModel = SliderImageModel(
          sliderImageName: await imagePickerController.getImageUrl(imagePath: imagePath.value.toString()),
          sliderImageCreatedAt: DateTime.now().toString(),
        );
        db.collection("sliderImages").add(sliderImageModel.toJson()).then((value) {
          var id = value.id;
          db.collection("sliderImages").doc(id).update({'sliderImageId' : id}).then((value) {
            Get.snackbar("SliderImage Added Successfully", imagePath.value);
          },);
        },);
        print("ImagePath : => ${imagePath.value}");
      }else{
        Get.snackbar("Please Select Image", "imagePath :  ${imagePath.value}");
        print("ImagePath : => ${imagePath.value}");
      }
      imagePath.value = "";
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }

}