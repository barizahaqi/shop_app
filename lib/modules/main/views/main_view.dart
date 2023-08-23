import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/modules/cart/views/cart_view.dart';
import 'package:shop_app/modules/cart/views/components/cart_filter.dart';
import 'package:shop_app/modules/main/controller/main_controller.dart';
import 'package:shop_app/modules/product/views/components/product_filter.dart';
import 'package:shop_app/modules/product/views/product_view.dart';
import 'package:shop_app/core/styles/app_styles.dart';
import 'package:shop_app/modules/settings/views/settings_view.dart';
import 'package:shop_app/modules/user/views/components/user_filter.dart';
import 'package:shop_app/modules/user/views/user_view.dart';
import 'package:shop_app/routes/app_route.dart';
import 'package:shop_app/widgets/custom_bottom_sheet.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: _bodyScreen(),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppStyles.backgroundColor,
            elevation: 0.0,
            title: Text(
              StringConstant.appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            centerTitle: true,
            actions: controller.currentIndex.value != 3
                ? [
                    IconButton(
                      onPressed: () {
                        if (controller.currentIndex.value == 0) {
                          showCustomBottomSheet(body: const ProductFilter());
                        } else if (controller.currentIndex.value == 1) {
                          showCustomBottomSheet(body: const CartFilter());
                        } else if (controller.currentIndex.value == 2) {
                          showCustomBottomSheet(body: const UserFilter());
                        }
                      },
                      icon: const Icon(Icons.filter_list),
                    ),
                  ]
                : null,
          ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                backgroundColor: AppStyles.secondaryColor,
                selectedItemColor: AppStyles.backgroundColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.currentIndex.value,
                onTap: (index) {
                  controller.changeIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.luggage),
                    label: 'Product',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Cart'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'User'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Setting')
                ],
              )),
          floatingActionButton: controller.currentIndex.value != 3
              ? FloatingActionButton(
                  onPressed: () {
                    if (controller.currentIndex.value == 0) {
                      Get.toNamed(AppRoute.addProduct);
                    } else if (controller.currentIndex.value == 1) {
                      Get.toNamed(AppRoute.addCart);
                    } else {
                      Get.toNamed(AppRoute.addUser);
                    }
                  },
                  backgroundColor: AppStyles.primaryColor,
                  child: const Icon(Icons.add),
                )
              : null,
        ));
  }

  Widget _bodyScreen() {
    switch (controller.currentIndex.value) {
      case 0:
        return const ProductView();
      case 1:
        return const CartView();
      case 2:
        return const UserView();
      case 3:
        return const SettingsView();
      default:
        return const SizedBox();
    }
  }
}
