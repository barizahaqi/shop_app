import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/api/datasources/cart_data_source.dart';
import 'package:shop_app/data/models/cart/cart_item.dart';
import 'package:shop_app/data/models/cart/request/cart_change_request.dart';
import 'package:shop_app/data/models/cart/request/cart_request.dart';
import 'package:shop_app/data/models/cart/response/cart_change_response.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';

class CartRepository extends GetxService {
  CartRepository({required this.cartDataSource});

  final CartDataSource cartDataSource;

  Future<Either<ErrorResponse, List<CartResponse>>> getCarts(
      String limit, String sort, String startDate, String endDate) async {
    CartRequest request = CartRequest(
        limit: limit, sort: sort, startDate: startDate, endDate: endDate);
    return cartDataSource.getCart(request);
  }

  Future<Either<ErrorResponse, CartResponse>> getCartById(String id) async {
    IdModel request = IdModel(id: id);
    return cartDataSource.getCartById(request);
  }

  Future<Either<ErrorResponse, List<CartResponse>>> getCartByUserId(
      String userId) async {
    IdModel request = IdModel(id: userId);
    return cartDataSource.getCartByUserId(request);
  }

  Future<Either<ErrorResponse, CartChangeResponse>> addCart(
      String userId, DateTime date, List<CartItem> products) async {
    CartChangeRequest request =
        CartChangeRequest(userId: userId, date: date, products: products);
    return cartDataSource.addCart(request);
  }

  Future<Either<ErrorResponse, CartChangeResponse>> updateCart(
      String id, String userId, DateTime date, List<CartItem> products) async {
    CartChangeRequest request = CartChangeRequest(
        id: id, userId: userId, date: date, products: products);
    return cartDataSource.updateCart(request);
  }

  Future<Either<ErrorResponse, CartResponse>> deleteCart(String id) async {
    IdModel request = IdModel(id: id);
    return cartDataSource.deleteCart(request);
  }
}
