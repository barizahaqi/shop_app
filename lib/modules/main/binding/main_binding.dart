import 'package:get/get.dart';
import 'package:shop_app/modules/cart/bindings/cart_binding.dart';
import 'package:shop_app/modules/main/controller/main_controller.dart';
import 'package:shop_app/modules/product/bindings/product_binding.dart';
import 'package:shop_app/modules/settings/bindings/settings_binding.dart';
import 'package:shop_app/modules/splash/bindings/splash_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // controller
    Get.put<MainController>(MainController(), permanent: true);

    SplashBinding().dependencies();
    ProductBinding().dependencies();
    CartBinding().dependencies();
    SettingsBinding().dependencies();
  }
}
