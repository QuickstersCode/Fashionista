import 'package:fashionista_app/screens/men_collection_tab.dart';
import 'package:fashionista_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.grey,
          title: CustomAppBar(
            icon: Icons.notifications_none,
            title: 'Discover',
            icon_2: Icons.shopping_cart_outlined,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.grey, width: 0.5), // ✅ Add top border
                    ),
                  ),
                  child: const TabBar(
                    labelColor: Colors.black, // Active tab color
                    unselectedLabelColor: Colors.grey, // Inactive tab color
                    indicatorColor: Colors.teal, // ✅ Match indicator color
                    indicatorWeight: 3.0, // ✅ Increase thickness
                    indicatorSize: TabBarIndicatorSize.tab, // ✅ Make full-width
                    tabs: [
                      Tab(text: 'Men'),
                      Tab(text: 'Women'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(), // ✅ Enable smooth scrolling
          children: [MenCollectionTab(), MenCollectionTab()],
        ),
      ),
    );
  }
}
