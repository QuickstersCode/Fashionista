import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MenCollectionTab extends StatelessWidget {
  MenCollectionTab({super.key});

  List image = [
    'assets/images/41.png',
    'assets/images/42.png',
    'assets/images/43.png',
    'assets/images/44.png',
    'assets/images/52.png',
    'assets/images/51.png',
    'assets/images/55.png',
    'assets/images/52.png',
  ];

  List catagory = [
    {'title': 'Shirts', 'image': 'assets/images/14.webp'},
    {'title': 'OuterWear', 'image': 'assets/images/6.png'},
    {'title': 'Long Pant', 'image': 'assets/images/8.jpeg'},
    {'title': 'Shorts', 'image': 'assets/images/4.webp'},
    {'title': 'Jackets', 'image': 'assets/images/7.webp'},
    {'title': 'Formal Shoes', 'image': 'assets/images/49.webp'},
    {'title': 'Bags', 'image': 'assets/images/55.png'},
    {'title': 'Jackets', 'image': 'assets/images/7.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _saleBanner().shakeX(
                infinite: true,
                delay: Duration(seconds: 2),
                duration: Duration(milliseconds: 1500)),
            ListView.separated(
              padding: EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 7,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemBuilder: (context, index) {
                return _catagoryCard(index)
                    .animate()
                    .fade(duration: 200.ms, delay: (index * 100).ms)
                    .slideX(begin: -1, end: 0, curve: Curves.easeOut);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _catagoryCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade400)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      catagory[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    catagory[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Container(
                height: 100,
                // width: 100,
                child: Image.asset(
                  image[index],
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          )),
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
}
