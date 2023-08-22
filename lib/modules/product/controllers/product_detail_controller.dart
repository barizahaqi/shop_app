import 'package:get/get.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/data/repositories/product_repository.dart';

class ProductDetailController extends GetxController
    with StateMixin<ProductResponse> {
  final ProductRepository productRepository;
  ProductDetailController({required this.productRepository});

  Future<void> getDetailProduct(String id) async {
    change(null, status: RxStatus.loading());
    final response = await productRepository.getProductById(id);
    response.fold(
        (failure) => {change(null, status: RxStatus.error(failure.message))},
        (success) => {change(success, status: RxStatus.success())});
  }
}
