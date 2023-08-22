import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/models/user/response/user_response.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/core/styles/app_styles.dart';

class UserCard extends StatelessWidget {
  final UserResponse user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.grey.withOpacity(0.5),
      color: AppStyles.secondaryColor,
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoute.detailUser, arguments: user.id);
        },
        child: ListTile(
            leading: const Icon(Icons.person),
            title: Text("${user.name.firstname} ${user.name.lastname}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    )),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text("Email : ${user.email}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        )),
                Text("Phone number: ${user.phone}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        )),
              ],
            )),
      ),
    );
  }
}
