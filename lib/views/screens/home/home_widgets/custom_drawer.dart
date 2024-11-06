import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_admin/views/screens/category/add_new_category.dart';
import 'package:foodys_admin/views/screens/category/show_category_screen.dart';
import 'package:foodys_admin/views/screens/seller/get_all_seller_screen.dart';
import 'package:foodys_admin/views/screens/upload_slider_image/upload_Slider_image_screen.dart';
import 'package:foodys_admin/views/screens/user/get_all_users_screen.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Ali"),
            accountEmail: Text("ali786@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("A", style: TextStyle(fontSize: 40.0),),
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.person), title: const Text("Sellers"),
            onTap: () {
              Get.to(const GetAllSellerScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.person), title: const Text("Users"),
            onTap: () {
              Get.to(const GetAllUsersScreen());
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.briefcase_fill), title: const Text("All Orders"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
              title:const Text("Category"),
            children: [
              ListTile(
                leading: const Icon(CupertinoIcons.circle_grid_3x3), title: const Text("Add Category"),
                onTap: () {
                  Get.to(const AddNewCategoryScreen());
                },
              ),
              ListTile(
                leading: const Icon(CupertinoIcons.circle_grid_3x3), title: const Text("Show Category"),
                onTap: () {
                  Get.to(const ShowCategoryScreen());
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.slider_horizontal_3), title: const Text("Add Slider"),
            onTap: () {
              Get.to(const UploadSliderImageScreen());
            },
          ),
        ],
      ),
    );
  }
}
