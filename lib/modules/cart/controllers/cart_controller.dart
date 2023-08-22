import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

class CartController extends GetxController
    with StateMixin<List<CartResponse>> {
  final CartRepository cartRepository;
  CartController({required this.cartRepository});

  TextEditingController limit = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  RxString sortLabel = "Ascending".obs;
  RxString sortValue = StringConstant.emptyString.obs;

  @override
  void onInit() {
    super.onInit();
    limit.text = StringConstant.emptyString;
    startDate.text = StringConstant.emptyString;
    endDate.text = StringConstant.emptyString;
    getCarts();
  }

  Future<void> getCarts() async {
    change([], status: RxStatus.loading());
    final response = await cartRepository.getCarts(
        limit.text, sortValue.value, startDate.text, endDate.text);
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
    getCarts();
  }
}
