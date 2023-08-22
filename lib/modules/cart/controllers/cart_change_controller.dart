import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/cart/cart_item.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

class CartChangeController extends GetxController {
  final CartRepository cartRepository;
  CartChangeController({required this.cartRepository});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<dynamic> listCart = [].obs;
  DateTime selectedDate = DateTime.now();

  void addCart(String userId) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await cartRepository.addCart(
          userId, selectedDate, listCart as List<CartItem>);
      response.fold(
          (failed) => Get.snackbar("Failed to add Cart", failed.message),
          (success) => Get.snackbar("Success", "Cart added"));
    }
  }

  void updateCart(String id, String userId) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response = await cartRepository.updateCart(
          id, userId, selectedDate, listCart as List<CartItem>);
      response.fold(
          (failed) => Get.snackbar("Failed to update Cart", failed.message),
          (success) => Get.snackbar("Success", "Cart updated"));
    }
  }

  void deleteCart(String id) async {
    final response = await cartRepository.deleteCart(id);
    response.fold(
        (failed) => Get.snackbar("Failed to delete Cart", failed.message),
        (success) => Get.snackbar("Success", "Cart deleted successfully"));
  }

  void initForm(List<CartItem> listCart, DateTime selectedDate) {
    this.listCart = listCart;
    this.selectedDate = selectedDate;
  }
}
