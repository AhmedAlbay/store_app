import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';

class CategoriesService {
  Future<List<ProductsModels>> getcategoriesproducts(
      // ignore: non_constant_identifier_names
      {required String CategoireName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$CategoireName', Token: '');

    List<ProductsModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModels.fromJson(data[i]),
      );

     
    } 
    return productsList;
  }
}
