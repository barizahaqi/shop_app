import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/user/controllers/user_controller.dart';
import 'package:shop_app/modules/user/views/components/user_card.dart';

class UserList extends GetView<UserController> {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state!.length,
        itemBuilder: (context, index) => UserCard(user: state[index]),
      ),
      onLoading: const Center(child: CircularProgressIndicator()),
      onEmpty: const Center(child: Text(StringConstant.emptyUser)),
      onError: (error) => Center(child: Text(error!)),
    );
  }
}
