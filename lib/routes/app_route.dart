import 'package:get/get.dart';
import 'package:shop_app/modules/cart/bindings/cart_change_binding.dart';
import 'package:shop_app/modules/cart/bindings/cart_detail_binding.dart';
import 'package:shop_app/modules/cart/views/cart_add_view.dart';
import 'package:shop_app/modules/cart/views/cart_detail_view.dart';
import 'package:shop_app/modules/cart/views/cart_edit_view.dart';
import 'package:shop_app/modules/login/bindings/login_binding.dart';
import 'package:shop_app/modules/login/views/login_view.dart';
import 'package:shop_app/modules/main/binding/main_binding.dart';
import 'package:shop_app/modules/main/views/main_view.dart';
import 'package:shop_app/modules/product/bindings/product_change_binding.dart';
import 'package:shop_app/modules/product/bindings/product_detail_binding.dart';
import 'package:shop_app/modules/product/views/product_add_view.dart';
import 'package:shop_app/modules/product/views/product_detail_view.dart';
import 'package:shop_app/modules/product/views/product_edit_view.dart';
import 'package:shop_app/modules/splash/bindings/splash_binding.dart';
import 'package:shop_app/modules/splash/views/splash_view.dart';
import 'package:shop_app/modules/user/bindings/user_change_binding.dart';
import 'package:shop_app/modules/user/bindings/user_detail_binding.dart';
import 'package:shop_app/modules/user/views/user_add_view.dart';
import 'package:shop_app/modules/user/views/user_detail_view.dart';
import 'package:shop_app/modules/user/views/user_edit_view.dart';

class AppRoute {
  static const String main = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String detailProduct = '/detail-product';
  static const String addProduct = '/add-product';
  static const String editProduct = '/edit-product';
  static const String detailCart = '/detail-cart';
  static const String addCart = '/add-cart';
  static const String editCart = '/edit-cart';
  static const String detailUser = '/detail-user';
  static const String addUser = '/add-user';
  static const String editUser = '/edit-user';

  static List<GetPage> routes = [
    GetPage(name: main, page: () => const MainView(), binding: MainBinding()),
    GetPage(
        name: splash, page: () => const SplashView(), binding: SplashBinding()),
    GetPage(
        name: login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(
        name: detailProduct,
        page: () => ProductDetailScreen(id: Get.arguments),
        binding: ProductDetailBinding()),
    GetPage(
        name: addProduct,
        page: () => const ProductAddView(),
        binding: ProductChangeBinding()),
    GetPage(
        name: editProduct,
        page: () => ProductEditView(
              product: Get.arguments,
            ),
        binding: ProductChangeBinding()),
    GetPage(
        name: detailCart,
        page: () => CartDetailScreen(id: Get.arguments),
        binding: CartDetailBinding()),
    GetPage(
        name: addCart,
        page: () => const CartAddView(),
        binding: CartChangeBinding()),
    GetPage(
        name: editCart,
        page: () => CartEditView(
              cart: Get.arguments,
            ),
        binding: CartChangeBinding()),
    GetPage(
        name: detailUser,
        page: () => UserDetailScreen(id: Get.arguments),
        binding: UserDetailBinding()),
    GetPage(
        name: addUser,
        page: () => const UserAddView(),
        binding: UserChangeBinding()),
    GetPage(
        name: editUser,
        page: () => UserEditView(
              user: Get.arguments,
            ),
        binding: UserChangeBinding()),
  ];
}
