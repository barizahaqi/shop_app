import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/data/repositories/product_repository.dart';
import 'package:shop_app/core/constants/string_constant.dart';

class ProductController extends GetxController
    with StateMixin<List<ProductResponse>> {
  final ProductRepository productRepository;
  ProductController({required this.productRepository});

  List<ProductResponse> products = [];
  TextEditingController limit = TextEditingController();
  RxString sortLabel = "Ascending".obs;
  RxString sortValue = StringConstant.emptyString.obs;

  @override
  void onInit() {
    super.onInit();
    limit.text = StringConstant.emptyString;
    initGetProducts();
    getProducts();
  }

  Future<void> initGetProducts() async {
    final response =
        await productRepository.getProducts(limit.text, sortValue.value);
    response.fold(
        (failure) => Get.snackbar("Failed to get Products", failure.message),
        (success) => {
              products = success,
            });
  }

  Future<void> getProducts() async {
    change([], status: RxStatus.loading());
    final response =
        await productRepository.getProducts(limit.text, sortValue.value);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {
              if (success.isNotEmpty)
                change(success, status: RxStatus.success())
              else
                change([], status: RxStatus.empty())
            });
  }

  Future<void> getProductsByCategory(String category) async {
    change([], status: RxStatus.loading());
    final response = await productRepository.getProductsByCategory(category);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {
              if (success.isNotEmpty)
                change(success, status: RxStatus.success())
              else
                change([], status: RxStatus.empty())
            });
  }

  void changeSort(String value) {
    sortLabel.value = value;
    if (value == "Ascending") {
      sortValue.value = "asc";
    } else {
      sortValue.value = "desc";
    }
  }

  void reset() {
    limit.text = StringConstant.emptyString;
    sortLabel.value = "Ascending";
    sortValue.value = StringConstant.emptyString;
    getProducts();
  }

  String getNameById(String id) {
    final product =
        products.firstWhere((element) => element.id.toString() == id);
    return product.title;
  }
}
