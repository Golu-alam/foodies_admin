import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodys_admin/models/seller_model.dart';
import 'package:get/get.dart';

class SellerController extends GetxController{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var sellerList = <SellerModel>[].obs;
  RxBool status = false.obs;

  Future<void> getAllSeller()async{
    isLoading.value = true;
    try{
      _db.collection("seller")
          .snapshots()
          .listen((snapshot) => sellerList.value = snapshot.docs
          .map((doc) => SellerModel.fromJson(doc.data()),).toList(),);
    }catch(e){
      print("Error => $e");
    }finally{
      isLoading.value = false;
    }
  }

  Future<void> changeSellerStatus({required String sellerId}) async {
      status.value = !status.value;
      try {
        await _db.collection("seller").doc(sellerId).update({
          "sellerStatus": status.value,
        });
      } catch (e) {
        print("Error => $e");
      }
  }

  @override
  void onInit() {
    getAllSeller();
    super.onInit();
  }
}