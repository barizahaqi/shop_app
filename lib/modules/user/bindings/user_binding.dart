import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/user_data_source.dart';
import 'package:shop_app/data/repositories/user_repository.dart';
import 'package:shop_app/modules/user/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  dependencies() {
    // datasources
    Get.put<UserDataSource>(UserDataSource(appBaseUrl: StringConstant.baseUrl),
        permanent: true);

    // repository
    Get.put<UserRepository>(UserRepository(userDataSource: Get.find()),
        permanent: true);
    // controller
    Get.put<UserController>(UserController(userRepository: Get.find()),
        permanent: true);
  }
}
