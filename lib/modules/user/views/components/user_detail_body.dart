import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/styles/app_styles.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';
import 'package:shop_app/modules/user/controllers/user_detail_controller.dart';
import 'package:shop_app/modules/user/views/components/user_cart.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/widgets/custom_primary_button.dart';

class UserDetailBody extends GetView<UserDetailController> {
  const UserDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _buildUserDetail(context, state!),
      onLoading: const Center(child: LinearProgressIndicator()),
      onError: (error) => Center(child: Text(error!)),
    );
  }

  Widget _buildUserDetail(BuildContext context, UserResponse user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "${user.name.firstname[0].toUpperCase()}${user.name.firstname.substring(1)} ${user.name.lastname[0].toUpperCase()}${user.name.lastname.substring(1)}",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Text(user.email, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Text(user.phone, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Text(
            "Address: ${user.adress.number} ${user.adress.street}, ${user.adress.city}, ${user.adress.zipcode}",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Text(
            "Longitude/Latitude: ${user.adress.geolocation.long}/${user.adress.geolocation.lat}",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Text("Username: ${user.username}",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        Text("Password: ${user.password}",
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 10),
        const UserCart(),
        const SizedBox(height: 20),
        CustomPrimaryButton(
            color: AppStyles.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.editUser, arguments: user);
            },
            text: "Edit User"),
        const SizedBox(height: 10),
        CustomPrimaryButton(
            color: Colors.red,
            onPressed: () {
              Get.find<UserChangeController>().deleteUser(user.id.toString());
              Get.back();
            },
            text: "Delete User")
      ],
    );
  }
}
