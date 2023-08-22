import 'package:get/get.dart';
import 'package:shop_app/data/repositories/product_repository.dart';
import 'package:shop_app/core/constants/string_constant.dart';
import 'package:shop_app/widgets/custom_snackbar.dart';

class ProductCategoriesController extends GetxController {
  final ProductRepository productRepository;
  ProductCategoriesController({required this.productRepository});

  final List<String> _listCategories = [StringConstant.defaultCategory].obs;
  List<String> get listCategories => _listCategories;

  List<String> _listCategoriesForm = [StringConstant.emptyString].obs;
  List<String> get listCategoriesForm => _listCategoriesForm;

  final RxString _category = StringConstant.defaultCategory.obs;
  RxString get category => _category;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  Future<void> getCategories() async {
    final response = await productRepository.getCategories();
    response.fold(
        (failed) => CustomSnackbar(
            title: "Failed to get Categories", message: failed.message),
        (success) => {
              _listCategories.addAll(success),
              _listCategoriesForm = success,
              update()
            });
    update();
  }

  void changeCategory(String category) {
    _category.value = category;
    update();
  }
}
