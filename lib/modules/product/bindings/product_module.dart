import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/product_data_source.dart';
import 'package:shop_app/data/repositories/product_repository.dart';

void initProductModule() {
  // datasources
  Get.lazyPut(() => ProductDataSource(appBaseUrl: StringConstant.baseUrl));

  // repository
  Get.lazyPut(() => ProductRepository(productDataSource: Get.find()));
}
