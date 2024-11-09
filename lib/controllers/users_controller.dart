import 'package:foodys_admin/models/user_model.dart';
import 'package:foodys_admin/views/utils/firebase_const/firebase_const.dart';
import 'package:get/get.dart';

class UsersController extends GetxController{
  var allUsers = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  
  Future<void> getAllUsers()async{
    isLoading.value = true;
    try{
      FirebaseConst
          .db
          .collection("users")
          .snapshots()
          .listen((snapshot) => allUsers.value = snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data()),).toList(),);
    }catch(e){
      print("Error => $e");
    }finally{
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAllUsers();
    super.onInit();
  }
}