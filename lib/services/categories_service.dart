import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';

class CategoriesService {
  Future<List<ProductsModels>> getcategoriesproducts(
      {required String CategoireName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$CategoireName');

    List<ProductsModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModels.fromJson(data[i]),
      );

     
    } 
    return productsList;
  }
}
