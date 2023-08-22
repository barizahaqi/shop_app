import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/exceptions/server_exception.dart';
import 'package:shop_app/data/api/api_client.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/product/request/product_category_request.dart';
import 'package:shop_app/data/models/product/request/product_change_request.dart';
import 'package:shop_app/data/models/product/response/product_change_response.dart';
import 'package:shop_app/data/models/product/request/product_request.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';
import 'package:shop_app/core/constants/string_constant.dart';

class ProductDataSource extends ApiClient {
  ProductDataSource({required String appBaseUrl})
      : super(appBaseUrl: appBaseUrl);

  Future<Either<ErrorResponse, List<ProductResponse>>> getProduct(
      ProductRequest request) async {
    try {
      final requestParams = {};

      if (request.limit.isNotEmpty) {
        requestParams['limit'] = request.limit;
      }

      if (request.sort.isNotEmpty) {
        requestParams['sort'] = request.sort;
      }

      var url = "${StringConstant.productsUrl}?";
      url = url +
          requestParams.entries.map((e) => '${e.key}=${e.value}').join('&');

      Response response = await getMethod(url);
      print(response.body);
      return Right((response.body as List)
          .map((e) => ProductResponse.fromJson(e))
          .toList());
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, ProductResponse>> getProductById(
      IdModel request) async {
    try {
      var url = "${StringConstant.productsUrl}/${request.id}";
      Response response = await getMethod(url);
      print(response.body);
      return Right(ProductResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, ProductChangeResponse>> addProduct(
      ProductChangeRequest request) async {
    try {
      var url = StringConstant.productsUrl;
      Response response = await postMethod(url, request.toJson());
      print(response.body);
      return Right(ProductChangeResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, ProductChangeResponse>> updateProduct(
      ProductChangeRequest request) async {
    try {
      var url = "${StringConstant.productsUrl}/${request.id}";
      Response response = await putMethod(url, request.toJson());
      print(response.body);
      return Right(ProductChangeResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, ProductResponse>> deleteProduct(
      IdModel request) async {
    try {
      var url = "${StringConstant.productsUrl}/${request.id}";
      Response response = await deleteMethod(url);
      print(response.body);
      return Right(ProductResponse.fromJson(response.body));
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, List<String>>> getCategories() async {
    try {
      var url = StringConstant.categoriesUrl;
      Response response = await getMethod(url);
      print(response.body);
      return Right((response.body as List).map((e) => e.toString()).toList());
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }

  Future<Either<ErrorResponse, List<ProductResponse>>> getProductByCategory(
      ProductCategoryRequest request) async {
    try {
      var url = "${StringConstant.productByCategoryUrl}/${request.category}";
      Response response = await getMethod(url);
      print(response.body);
      return Right((response.body as List)
          .map((e) => ProductResponse.fromJson(e))
          .toList());
    } on ServerException catch (e) {
      return Left(ErrorResponse(message: e.message));
    }
  }
}
