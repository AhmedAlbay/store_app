import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';
import 'dart:convert';

class UpdateProductService {
  Future<ProductsModels> UpdateProducts(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    print('prodect id $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return ProductsModels.fromJson(data);
  }
}
