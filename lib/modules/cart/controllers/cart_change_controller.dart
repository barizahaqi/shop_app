import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/data/models/cart/cart_item.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

class CartChangeController extends GetxController {
  final CartRepository cartRepository;
  CartChangeController({required this.cartRepository});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextEditingController> listCartId =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> listCartQuantity =
      <TextEditingController>[TextEditingController()].obs;
  List<CartItem> listCart = [];

  final userId = GetStorage().read("id");

  void addCart() async {
    if (formKey.currentState!.validate()) {
      Get.back();
      for (int i = 0; i < listCartId.length; i++) {
        listCart.add(CartItem(
            productId: int.parse(listCartId[i].text),
            quantity: int.parse(listCartQuantity[i].text)));

        final response =
            await cartRepository.addCart(userId, DateTime.now(), listCart);
        response.fold(
            (failed) => Get.snackbar("Failed to add Cart", failed.message),
            (success) => Get.snackbar("Success", "Cart added"));
      }
    }
  }

  void updateCart(String id) async {
    if (formKey.currentState!.validate()) {
      Get.back();
      final response =
          await cartRepository.updateCart(id, userId, DateTime.now(), listCart);
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
    listCartId.clear();
    listCartQuantity.clear();
    for (int i = 0; i < listCart.length; i++) {
      listCartId.add(TextEditingController(
        text: listCart[i].productId.toString(),
      ));
      listCartQuantity.add(TextEditingController(
        text: listCart[i].quantity.toString(),
      ));
    }
  }
}
