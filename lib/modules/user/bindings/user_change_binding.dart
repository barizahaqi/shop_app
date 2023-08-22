import 'package:get/get.dart';
import 'package:shop_app/modules/user/bindings/user_module.dart';
import 'package:shop_app/modules/user/controllers/user_change_controller.dart';

class UserChangeBinding extends Bindings {
  @override
  dependencies() {
    initUserModule();

    // controller
    Get.lazyPut(() => UserChangeController(userRepository: Get.find()),
        fenix: true);
  }
}
