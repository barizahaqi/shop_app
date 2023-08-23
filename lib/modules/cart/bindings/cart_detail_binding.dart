import 'package:get/get.dart';
import 'package:shop_app/modules/cart/controllers/cart_change_controller.dart';
import 'package:shop_app/modules/cart/controllers/cart_detail_controller.dart';
import 'package:shop_app/modules/cart/controllers/cart_user_controller.dart';

class CartDetailBinding extends Bindings {
  @override
  dependencies() {
    // controller
    Get.lazyPut(() => CartDetailController(cartRepository: Get.find()));
    Get.lazyPut(() => CartChangeController(cartRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => CartUserController(cartRepository: Get.find()),
        fenix: true);
  }
}
