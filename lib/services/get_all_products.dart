
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products.dart';

class GetAllProducts {
  Future<List<ProductsModels>> AllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductsModels> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductsModels.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
