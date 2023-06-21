import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/models/products.dart';

class CategoriesService{



Future <List<ProductsModels>>  categoriesproducts({required String CategoireName})async{

    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/category/$CategoireName'));

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


