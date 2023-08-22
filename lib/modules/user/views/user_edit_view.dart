import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';
import 'package:shop_app/modules/user/views/components/user_form.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class UserEditView extends StatefulWidget {
  const UserEditView({
    super.key,
    required this.user,
  });
  final UserResponse user;

  @override
  State<UserEditView> createState() => _UserEditViewState();
}

class _UserEditViewState extends State<UserEditView> {
  @override
  void initState() {
    super.initState();
    Get.find<UserChangeController>().initForm(
        widget.user.email,
        widget.user.username,
        widget.user.password,
        widget.user.name.firstname,
        widget.user.name.lastname,
        widget.user.adress.city,
        widget.user.adress.street,
        widget.user.adress.number.toString(),
        widget.user.adress.zipcode,
        widget.user.adress.geolocation.lat,
        widget.user.adress.geolocation.long,
        widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add User'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const UserForm(),
              const SizedBox(height: 20),
              CustomPrimaryButton(
                onPressed: () {
                  Get.find<UserChangeController>()
                      .updateUser(widget.user.id.toString());
                },
                text: "Edit User",
              ),
            ],
          ),
        ));
  }
}
