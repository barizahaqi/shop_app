import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/exceptions/server_exception.dart';
import 'package:shop_app/data/api/api_client.dart';
import 'package:shop_app/data/models/cart/request/cart_change_request.dart';
import 'package:shop_app/data/models/cart/request/cart_request.dart';
import 'package:shop_app/data/models/cart/response/cart_change_response.dart';
import 'package:shop_app/data/models/cart/response/cart_response.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';

import 'package:shop_app/core/constants/string_constant.dart';

class CartDataSource extends ApiClient {
  CartDataSource({required String appBaseUrl}) : super(appBaseUrl: appBaseUrl);

  Future<Either<ErrorResponse, List<CartResponse>>> getCart(
      CartRequest request) async {
    try {
      final requestParams = {};

      if (request.limit.isNotEmpty) {
        requestParams['limit'] = request.limit;
      }

      if (request.sort.isNotEmpty) {
        requestParams['sort'] = request.sort;
      }

      if (request.startDate.isNotEmpty) {
        requestParams['startDate'] = request.startDate;
      }

      if (request.endDate.isNotEmpty) {
        requestParams['endDate'] = request.endDate;
      }

      var url = "${StringConstant.cartUrl}?";
      url = url +
          requestParams.entries.map((e) => '${e.key}=${e.value}').join('&');

      Response response = await getMethod(url);
      return Right((response.body as List)
          .map((e) => CartResponse.fromJson(e))
          .toList());
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, CartResponse>> getCartById(
      IdModel request) async {
    try {
      var url = "${StringConstant.cartUrl}/${request.id}";
      Response response = await getMethod(url);
      return Right(CartResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, CartResponse>> getCartByUserId(
      IdModel request) async {
    try {
      var url = "${StringConstant.userCartUrl}/${request.id}";
      Response response = await getMethod(url);
      return Right(CartResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, CartChangeResponse>> addCart(
      CartChangeRequest request) async {
    try {
      var url = StringConstant.cartUrl;
      Response response = await postMethod(url, request.toJson());
      return Right(CartChangeResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, CartChangeResponse>> updateCart(
      CartChangeRequest request) async {
    try {
      var url = "${StringConstant.cartUrl}/${request.id}";
      Response response = await putMethod(url, request.toJson());
      return Right(CartChangeResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, CartResponse>> deleteCart(
      IdModel request) async {
    try {
      var url = "${StringConstant.cartUrl}/${request.id}";
      Response response = await deleteMethod(url);
      return Right(CartResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }
}
