import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/user/controllers/user_detail_controller.dart';
import 'package:shop_app/modules/user/views/components/user_detail_body.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<UserDetailController>().getDetailUser(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstant.detailUserTitle),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: UserDetailBody(),
        ));
  }
}
