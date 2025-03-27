import 'package:animate_do/animate_do.dart';
import 'package:fashionista_app/controllers/home_page_controller.dart';
import 'package:fashionista_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomePageController controller = Get.put(HomePageController());

  List catagory = [
    {'title': 'Shirts', 'image': 'assets/images/14.webp'},
    {'title': 'OuterWear', 'image': 'assets/images/6.png'},
    {'title': 'Long Pant', 'image': 'assets/images/8.jpeg'},
    {'title': 'Shorts', 'image': 'assets/images/4.webp'},
    {'title': 'Jackets', 'image': 'assets/images/7.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.grey,
        title: CustomAppBar(
            icon: Icons.notifications_none,
            title: 'Home',
            icon_2: Icons.shopping_cart_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search Product'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 110,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: catagory.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                    image: AssetImage(catagory[index]['image']),
                                    fit: BoxFit.scaleDown),
                                shape: BoxShape.circle),
                          ),
                        ).fadeInLeft(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(catagory[index]['title'])
                      ],
                    );
                  },
                ),
              ),
            ),
            _titleRow('Recomended for you'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: controller.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return _productContainer(index);
                },
              ),
            ).fadeInUpBig(duration: Duration(milliseconds: 800)),
            _saleBanner().shakeX(infinite: T, duration: Duration(seconds: 2)),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: _titleRow('Sale'),
            ),
            SizedBox(
              height: 125,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 20, bottom: 20, right: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _saleProductCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saleProductCard(int index) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  controller.products[index].image,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.products[index].catagory,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                controller.products[index].name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${controller.products[index].discountPrice}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${controller.products[index].price}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'See More',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.teal),
            ),
          )
        ],
      ),
    );
  }

  Widget _saleBanner() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade400],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "JUST FOR YOU",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "SALE",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "UP TO 65%",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productContainer(int index) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(controller.products[index].image),
                      scale: 1,
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter)),
            ),
            Obx(
              () => Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () => controller.toggleFavorite(index),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      controller.products[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: controller.products[index].isFavorite
                          ? Colors.red
                          : Colors.grey,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.products[index].catagory,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                controller.products[index].name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Text("\$${controller.products[index].discountPrice}",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.teal)),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "\$${controller.products[index].price}",
                    style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFA6AEBE)),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
