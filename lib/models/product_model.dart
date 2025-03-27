class ProductModel {
  final String name;
  final String catagory;
  final String image;
  final double price;
  final double discountPrice;
  bool isFavorite;

  ProductModel({
    required this.name,
    required this.catagory,
    required this.image,
    required this.price,
    required this.discountPrice,
    this.isFavorite = false,
  });
}
