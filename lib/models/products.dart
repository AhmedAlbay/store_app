class ProductsModels {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;
  ProductsModels(
      {required this.id,
      required this.description,
      required this.image,
      required this.price,
      required this.title,
      required this.category,
      required this.rating});
  factory ProductsModels.fromJson(jsonData) {
    return ProductsModels(
        id: jsonData['id'],
        description: jsonData['description'],
        image: jsonData['image'],
        price: jsonData['price'],
        title: jsonData['title'],
        category: jsonData['category'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
