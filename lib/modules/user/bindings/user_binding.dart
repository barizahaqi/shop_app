import 'package:get/get.dart';
import 'package:shop_app/modules/user/bindings/user_module.dart';
import 'package:shop_app/modules/user/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  dependencies() {
    initUserModule();

    // controller
    Get.lazyPut(() => UserController(userRepository: Get.find()));
  }
}
