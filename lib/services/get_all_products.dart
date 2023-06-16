import 'dart:convert';

import 'package:store_app/models/products.dart';
import 'package:http/http.dart' as http;

class GetAllProducts {
  Future<List<ProductsModels>> AllProducts() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    List<dynamic> data = jsonDecode(response.body);

    List<ProductsModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModels.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
