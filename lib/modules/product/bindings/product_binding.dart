import 'package:get/get.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/data/api/datasources/product_data_source.dart';
import 'package:shop_app/data/repositories/product_repository.dart';
import 'package:shop_app/modules/product/controllers/product_categories_controller.dart';
import 'package:shop_app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  dependencies() {
    // datasources
    Get.put<ProductDataSource>(
        ProductDataSource(appBaseUrl: StringConstant.baseUrl),
        permanent: true);

    // repository
    Get.put<ProductRepository>(ProductRepository(productDataSource: Get.find()),
        permanent: true);

    // controller
    Get.put<ProductController>(ProductController(productRepository: Get.find()),
        permanent: true);
    Get.put<ProductCategoriesController>(
        ProductCategoriesController(productRepository: Get.find()),
        permanent: true);
  }
}
