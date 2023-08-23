import 'package:get/get.dart';
import 'package:shop_app/modules/cart/controllers/cart_user_controller.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';
import 'package:shop_app/modules/user/controllers/user_detail_controller.dart';

class UserDetailBinding extends Bindings {
  @override
  dependencies() {
    // controller
    Get.lazyPut(() => UserDetailController(userRepository: Get.find()));
    Get.lazyPut(() => UserChangeController(userRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => CartUserController(cartRepository: Get.find()));
  }
}
