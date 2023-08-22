import 'package:get/get.dart';
import 'package:shop_app/modules/cart/bindings/cart_binding.dart';
import 'package:shop_app/modules/main/controller/main_controller.dart';
import 'package:shop_app/modules/product/bindings/product_binding.dart';
import 'package:shop_app/modules/user/bindings/user_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    ProductBinding().dependencies();
    CartBinding().dependencies();
    UserBinding().dependencies();

    // controller
    Get.lazyPut(() => MainController());
  }
}
