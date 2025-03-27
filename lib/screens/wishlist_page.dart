import 'package:animate_do/animate_do.dart';
import 'package:fashionista_app/controllers/home_page_controller.dart';
import 'package:fashionista_app/widgets/border_line.dart';
import 'package:fashionista_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});

  HomePageController controller = Get.put(HomePageController());

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
            title: 'WishList',
            icon_2: Icons.shopping_cart_outlined),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BorderLine(),
            Obx(
              () => (controller.products.length - 3) == 0
                  ? Container(
                      height: MediaQuery.sizeOf(context).height - 140,
                      child: Center(
                        child: Text(
                          "😔 Oh no! Your Wishlist is empty...\n🛒 Start adding your favorite items!",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: controller.products.length - 3,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 110,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(controller
                                                .products[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      height: 120,
                                      // color: Colors.amber,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller
                                                    .products[index].catagory,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 2),
                                                child: Text(
                                                  controller
                                                      .products[index].name,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                      "\$${controller.products[index].discountPrice}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.teal)),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "\$${controller.products[index].price}",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFA6AEBE)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Text(
                                            'Add to cart',
                                            style:
                                                TextStyle(color: Colors.teal),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 10,
                                child: InkWell(
                                  onTap: () {
                                    controller.products.removeAt(index);
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ).fadeIn(delay: Duration(milliseconds: index * 200));
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
