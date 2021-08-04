import 'package:flutter/material.dart';
import 'package:food/pages/widget/show_product.dart';
import 'package:food/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/list.png', width: 20),
            Image.asset('assets/cart.png', width: 20),
          ],
        ),
      );
    }

    Widget search() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bg1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search',
                    hintStyle: secondaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Icon(Icons.search_outlined, color: secondaryColor),
            ],
          ),
        ),
      );
    }

    Widget category(int index, String text) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          child: Column(
            children: [
              Text(
                text,
                style: secondaryTextStyle.copyWith(
                  color: selectedIndex == index ? primaryColor : secondaryColor,
                ),
              ),
              selectedIndex == index
                  ? Container(
                      width: 20,
                      height: 2,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(1),
                      ),
                    )
                  : SizedBox(height: 2),
            ],
          ),
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            category(0, 'Fast Food'),
            category(1, 'Dessert'),
            category(2, 'Drinks'),
            category(3, 'Snacks'),
          ],
        ),
      );
    }

    Widget product(int id, String title, String image, String price) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowProduct(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: bg1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(image, width: 68),
                    SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          title,
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        Text(
                          'Delicious food 2020',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          price,
                          style:
                              primaryTextStyle.copyWith(fontWeight: semiBold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ),
      );
    }

    Widget products() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Food',
              style: primaryTextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 18),
            product(0, 'Pizza', 'assets/pizza.png', 'IDR 49.999'),
            product(1, 'Hamburger', 'assets/hamburger.png', 'IDR 59.999'),
            product(2, 'Double Hotdogs', 'assets/hotdog.png', 'IDR 34.999'),
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          search(),
          categories(),
          products(),
        ],
      ),
    );
  }
}
