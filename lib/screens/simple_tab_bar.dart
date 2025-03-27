import 'package:flutter/material.dart';

class SimpleTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          Container(
            color: Colors.white, // Background color of tab bar
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: Colors.teal, // Underline color
                ),
                insets: EdgeInsets.symmetric(horizontal: -70.0), // Line Padding
              ),
              labelColor: Colors.black, // Selected tab text color
              unselectedLabelColor: Colors.grey, // Unselected tab color
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              tabs: [
                Tab(text: "Men"),
                Tab(text: "Women"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("Men's Collection")),
                Center(child: Text("Women's Collection")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
