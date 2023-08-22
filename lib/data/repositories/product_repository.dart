import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:shop_app/data/api/datasources/product_data_source.dart';
import 'package:shop_app/data/models/common/id_model.dart';
import 'package:shop_app/data/models/error/error_response.dart';
import 'package:shop_app/data/models/product/request/product_category_request.dart';
import 'package:shop_app/data/models/product/request/product_change_request.dart';
import 'package:shop_app/data/models/product/response/product_change_response.dart';
import 'package:shop_app/data/models/product/request/product_request.dart';
import 'package:shop_app/data/models/product/response/product_response.dart';

class ProductRepository extends GetxService {
  ProductRepository({required this.productDataSource});

  final ProductDataSource productDataSource;

  Future<Either<ErrorResponse, List<ProductResponse>>> getProducts(
      String limit, String sort) async {
    ProductRequest request = ProductRequest(limit: limit, sort: sort);
    return productDataSource.getProduct(request);
  }

  Future<Either<ErrorResponse, ProductResponse>> getProductById(
      String id) async {
    IdModel request = IdModel(id: id);
    return productDataSource.getProductById(request);
  }

  Future<Either<ErrorResponse, ProductChangeResponse>> addProduct(String title,
      String price, String description, String image, String category) async {
    ProductChangeRequest request = ProductChangeRequest(
        title: title,
        price: price,
        description: description,
        image: image,
        category: category);
    return productDataSource.addProduct(request);
  }

  Future<Either<ErrorResponse, ProductChangeResponse>> updateProduct(
      String id,
      String title,
      String price,
      String description,
      String image,
      String category) async {
    ProductChangeRequest request = ProductChangeRequest(
        id: id,
        title: title,
        price: price,
        description: description,
        image: image,
        category: category);
    return productDataSource.updateProduct(request);
  }

  Future<Either<ErrorResponse, ProductResponse>> deleteProduct(
      String id) async {
    IdModel request = IdModel(id: id);
    return productDataSource.deleteProduct(request);
  }

  Future<Either<ErrorResponse, List<String>>> getCategories() async {
    return productDataSource.getCategories();
  }

  Future<Either<ErrorResponse, List<ProductResponse>>> getProductsByCategory(
      String category) async {
    ProductCategoryRequest request = ProductCategoryRequest(category: category);
    return productDataSource.getProductByCategory(request);
  }
}
