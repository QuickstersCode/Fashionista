import 'package:fashionista_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var products = <ProductModel>[
    ProductModel(
      name: "Casual T-Shirt Grey",
      catagory: 'T-Shirt Men',
      image: "assets/images/21.webp",
      price: 24.00,
      discountPrice: 24.00,
    ),
    ProductModel(
        name: "Fleece hoddie Black",
        catagory: 'OuterWear Men',
        image: "assets/images/26.jpg",
        price: 84.00,
        discountPrice: 68.00,
        isFavorite: true),
    ProductModel(
        name: "Fleece SweatShirt",
        catagory: 'OuterWear Men',
        image: "assets/images/23.jpg",
        price: 86.00,
        discountPrice: 76.00,
        isFavorite: true),
    ProductModel(
      name: "Coach Jacket Navy",
      catagory: 'OuterWear Men',
      image: "assets/images/24.webp",
      price: 80.00,
      discountPrice: 70.00,
    ),
    ProductModel(
        name: "Fleece hoddie Black",
        catagory: 'OuterWear Men',
        image: "assets/images/26.jpg",
        price: 84.00,
        discountPrice: 68.00,
        isFavorite: true),
    ProductModel(
      name: "Casual T-Shirt Grey",
      catagory: 'T-Shirt Men',
      image: "assets/images/21.webp",
      price: 24.00,
      discountPrice: 24.00,
    ),
  ].obs;

  void toggleFavorite(int index) {
    products[index].isFavorite = !products[index].isFavorite;
    products.refresh();
  }
}
