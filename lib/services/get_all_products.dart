
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';

class GetAllProducts {
  // ignore: non_constant_identifier_names
  Future<List<ProductsModels>> AllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products', Token: '');
    List<ProductsModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModels.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
