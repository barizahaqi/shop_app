import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/repositories/product_repository.dart';
import 'package:shop_app/modules/product/controllers/product_categories_controller.dart';

class ProductChangeController extends GetxController {
  final ProductRepository productRepository;
  ProductChangeController({required this.productRepository});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController image = TextEditingController();
  RxString category =
      Get.find<ProductCategoriesController>().listCategoriesForm[0].obs;

  void addProduct() async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await productRepository.addProduct(
          title.text, price.text, description.text, image.text, category.value);
      response.fold(
          (failed) => Get.snackbar("Failed to add Product", failed.message),
          (success) => Get.snackbar("Success", "Product added"));
    }
  }

  void updateProduct(String id) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await productRepository.updateProduct(id, title.text,
          price.text, description.text, image.text, category.value);
      response.fold(
          (failed) => Get.snackbar("Failed to update Product", failed.message),
          (success) => Get.snackbar("Success", "Product updated"));
    }
  }

  void deleteProduct(String id) async {
    final response = await productRepository.deleteProduct(id);
    response.fold(
        (failed) => Get.snackbar("Failed to delete Product", failed.message),
        (success) => Get.snackbar("Success", "Product deleted successfully"));
  }

  void changeCategory(String value) {
    category.value = value;
  }

  void initForm(String title, String price, String description, String image,
      String category) {
    this.title.text = title;
    this.price.text = price;
    this.description.text = description;
    this.image.text = image;
    this.category.value = category;
  }
}
