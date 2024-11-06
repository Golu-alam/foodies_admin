import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodys_admin/controllers/category_controller.dart';
import 'package:get/get.dart';

class CustomTabWidget extends StatelessWidget {
  final String text;
  const CustomTabWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 300, // Set a fixed height for the ListView
          child: Obx(() {
            if (categoryController.isLoading.value) {
              return const Center(child: CupertinoActivityIndicator());
            }
            if (categoryController.allCategory.isEmpty) {
              return const Center(child: Text("Category Not Available"));
            }
            return ListView.builder(
              itemCount: categoryController.allCategory.length,
              itemBuilder: (context, index) {
                var data = categoryController.allCategory[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: data.categoryImage ?? "",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const Center(child: CupertinoActivityIndicator()),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error, size: 50),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.categoryName ?? "",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(data.id ?? ""),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

}
