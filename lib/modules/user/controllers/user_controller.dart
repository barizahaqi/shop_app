import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/data/models/user/user_component.dart';
import 'package:shop_app/data/repositories/user_repository.dart';

class UserController extends GetxController
    with StateMixin<List<UserResponse>> {
  final UserRepository userRepository;
  UserController({required this.userRepository});

  TextEditingController limit = TextEditingController();
  RxString sortLabel = "Ascending".obs;
  RxString sortValue = StringConstant.emptyString.obs;

  List<UserResponse> users = <UserResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    limit.text = StringConstant.emptyString;
    initGetUsers();
    getUsers();
  }

  Future<void> initGetUsers() async {
    final response = await userRepository.getUsers(limit.text, sortValue.value);
    response.fold(
        (failure) => Get.snackbar("Failed to get Users", failure.message),
        (success) => {
              users = success,
            });
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

  String getNameById(String id) {
    UserName name =
        users.firstWhere((element) => element.id.toString() == id).name;
    return "${name.firstname} ${name.lastname}";
  }

  void saveId(String username, String password) {
    String id = users
        .firstWhere((element) =>
            element.username == username && element.password == password)
        .id
        .toString();
    GetStorage().write("id", id);
  }
}
