import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/cart_data_source.dart';
import 'package:shop_app/data/repositories/cart_repository.dart';

void initCartModule() {
  // datasources
  Get.lazyPut(() => CartDataSource(appBaseUrl: StringConstant.baseUrl));

  // repository
  Get.lazyPut(() => CartRepository(cartDataSource: Get.find()));
}
