import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/users_controller.dart';
import 'package:get/get.dart';

class GetAllUsersScreen extends StatelessWidget {
  const GetAllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersController usersController = Get.put(UsersController());
    return Scaffold(
      appBar: AppBar(title: const Text("Users"), actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200],
                border: Border.all(color: Colors.blue, width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Obx(() {
                return Text(usersController.allUsers.length.toString());
              }),
            ),
          ),
        )
      ],),
      body: Obx(() {
        if (usersController.allUsers.isEmpty) {
          return const Center(child: Text("User Not Available"),);
        }
        if (usersController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator(),);
        }
        return ListView.builder(
          itemCount: usersController.allUsers.length,
          itemBuilder: (context, index) {
            var data = usersController.allUsers[index];
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: data.userProfileImage ?? "",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const Center(child: CupertinoActivityIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ),
                  title: Text(data.userName ?? "Unknown UserName", overflow: TextOverflow.ellipsis,),
                ),
              ),
            );
          },
        );
      },),
    );
  }
}
