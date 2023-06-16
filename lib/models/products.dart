

class ProductsModels {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;
  ProductsModels(
      {required this.id,
      required this.description,
      required this.image,
      required this.price,
      required this.title,
      required this.rating});
  factory ProductsModels.fromJson(jsonData) {
    return ProductsModels(
        id: jsonData['id'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price'],
        title: jsonData['title'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
