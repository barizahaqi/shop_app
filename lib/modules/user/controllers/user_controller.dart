import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/data/repositories/user_repository.dart';

class UserController extends GetxController
    with StateMixin<List<UserResponse>> {
  final UserRepository userRepository;
  UserController({required this.userRepository});

  TextEditingController limit = TextEditingController();
  RxString sortLabel = "Ascending".obs;
  RxString sortValue = StringConstant.emptyString.obs;

  @override
  void onInit() {
    super.onInit();
    limit.text = StringConstant.emptyString;
    getUsers();
  }

  Future<void> getUsers() async {
    change([], status: RxStatus.loading());
    final response = await userRepository.getUsers(limit.text, sortValue.value);
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
    getUsers();
  }
}
