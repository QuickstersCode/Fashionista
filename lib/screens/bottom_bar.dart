import 'package:fashionista_app/controllers/bottom_bar_controller.dart';
import 'package:fashionista_app/screens/account_page.dart';
import 'package:fashionista_app/screens/discover_page.dart';
import 'package:fashionista_app/screens/home_page.dart';
import 'package:fashionista_app/screens/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  BottomBarController controller = Get.put(BottomBarController());

  List pages = [HomePage(), DiscoverPage(), WishlistPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 2,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectBottomBarIndex.value,
              onTap: (value) {
                controller.selectBottomBarIndex.value = value;
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(controller.selectBottomBarIndex.value == 0
                        ? Icons.home
                        : Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Discover'),
                BottomNavigationBarItem(
                    icon: Icon(controller.selectBottomBarIndex.value == 2
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline),
                    label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(controller.selectBottomBarIndex.value == 3
                        ? Icons.person
                        : Icons.person_2_outlined),
                    label: 'Account'),
              ]),
        ),
      ),
      body: Obx(
        () => pages[controller.selectBottomBarIndex.value],
      ),
    );
  }
}
