import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/user_data_source.dart';
import 'package:shop_app/data/repositories/user_repository.dart';

void initUserModule() {
  // datasources
  Get.lazyPut(() => UserDataSource(appBaseUrl: StringConstant.baseUrl));

  // repository
  Get.lazyPut(() => UserRepository(userDataSource: Get.find()));
}
