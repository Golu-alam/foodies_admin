import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{

  final storage = FirebaseStorage.instance;

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


}