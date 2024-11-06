import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/seller_controller.dart';
import 'package:get/get.dart';

class GetAllSellerScreen extends StatelessWidget {
  const GetAllSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SellerController sellerController = Get.put(SellerController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seller"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.blue, width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Obx(() {
                  return Text(sellerController.sellerList.length.toString());
                }),
              ),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (sellerController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (sellerController.sellerList.isEmpty) {
          return const Center(child: Text("Seller Not Available"));
        }

        return ListView.builder(
          itemCount: sellerController.sellerList.length,
          itemBuilder: (context, index) {
            var data = sellerController.sellerList[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]
                ),
                child: ListTile(
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl: data.sellerImage ?? "",
                      placeholder: (context, url) =>
                      const Center(child: CupertinoActivityIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  title: Text(data.sellerName ?? "Unknown Seller",
                    overflow: TextOverflow.ellipsis,),
                  trailing: GestureDetector(
                    onTap: () {
                      sellerController.changeSellerStatus(
                          sellerId: data.sellerId.toString());
                    },
                    child: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: data.sellerStatus == true ? Colors.red : Colors
                            .green,
                      ),
                      child: Center(
                        child: Text(
                          data.sellerStatus == true ? "Block" : "Approved",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
