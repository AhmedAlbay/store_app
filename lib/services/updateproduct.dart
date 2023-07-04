// ignore_for_file: non_constant_identifier_names

import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';

class UpdateProductService {
  Future<ProductsModels> UpdateProducts(
      {required String title,
      required String price,
      required String description,
      required String image,
      required int id,
      required String category}) async {
    // ignore: avoid_print
    print('prodect id $id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    }, token: '');
    return ProductsModels.fromJson(data);
  }
}
