import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{
  final storage = FirebaseStorage.instance;
  var categoryImage = "".obs;

  Future<void> pickImage({required RxString imagePath})async{
    ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }

  Future<String> getImageUrl({required String imagePath})async{
    try{
      var imageName = DateTime.now().microsecondsSinceEpoch.toString();
      var storageRef = storage.ref().child("sliderImage/$imageName.jpg");
      var uploadTask = storageRef.putFile(File(imagePath));
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      print("Image Url :=> $downloadUrl");
      return downloadUrl;
    }catch(e){
      print(e);
      return "";
    }
  }

  Future<void> pickCategoryImage({required ImageSource source})async{
    final ImagePicker imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: source);
    if(image != null){
      categoryImage.value = image.path.toString();
    }
  }

  Future<String> imageStoreInStorage({required String collectionName})async{
    var imageName = DateTime.now().microsecondsSinceEpoch.toString();
    var storageRef = storage.ref().child("$collectionName/$imageName.jpg");
    var uploadTask = storageRef.putFile(File(categoryImage.value));
    var downloadUrl = await(await uploadTask).ref.getDownloadURL();
    print("Image Url => $downloadUrl");
    return downloadUrl;
  }


}