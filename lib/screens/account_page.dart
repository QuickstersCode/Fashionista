import 'package:animate_do/animate_do.dart';
import 'package:fashionista_app/widgets/border_line.dart';
import 'package:fashionista_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  List accountOptionList = [
    {
      'icon': Icons.shopping_cart_outlined,
      'title': 'My Orders',
    },
    {
      'icon': Icons.confirmation_number_outlined,
      'title': 'My Coupons',
    },
    {
      'icon': Icons.location_on_outlined,
      'title': 'Address Book',
    },
    {
      'icon': Icons.payment,
      'title': 'Payment Method',
    },
    {
      'icon': Icons.notifications_none,
      'title': 'Notifications',
    },
    {
      'icon': Icons.help_center_outlined,
      'title': 'Need Help?',
    },
    {
      'icon': Icons.star_border,
      'title': 'Rating & Feedback',
    },
    {
      'icon': Icons.phone,
      'title': 'Connect to Us',
    },
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
            title: 'My Account',
            icon_2: Icons.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BorderLine(),
            _accountContainer(),
            BorderLine(),
            ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return index == 4
                    ? BorderLine()
                    : Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey.shade200,
                      );
              },
              itemCount: accountOptionList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    leading: Icon(
                      accountOptionList[index]['icon'],
                      color: Colors.teal,
                    ),
                    title: Text(accountOptionList[index]['title']),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                    onTap: () {},
                  ).fadeIn(delay: Duration(milliseconds: index * 50)),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _accountContainer() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.teal.shade400,
                  child: Text(
                    "CR",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        'Christiano Ronaldo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '@myemail.gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_location_alt_outlined,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
