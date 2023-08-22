import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/login_data_source.dart';
import 'package:shop_app/data/repositories/login_repository.dart';
import 'package:shop_app/modules/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // datasources
    Get.lazyPut(() => LoginDataSource(appBaseUrl: StringConstant.baseUrl));

    // repository
    Get.lazyPut(() => LoginRepository(loginDataSource: Get.find()));

    // controller
    Get.lazyPut<LoginController>(
        () => LoginController(loginRepository: Get.find()));
  }
}
