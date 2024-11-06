import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/category_controller.dart';

class ShowCategoryScreen extends StatelessWidget {
  const ShowCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(title: const Text("Categories"),),
      body: Obx(() {
              if (categoryController.isLoading.value) {
                return const Center(child: CupertinoActivityIndicator());
              }
              if (categoryController.allCategory.isEmpty) {
                return const Center(child: Text("Category Not Available"));
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
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
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            })
    );
  }
}
