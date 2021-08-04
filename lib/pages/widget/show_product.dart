import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  int selectedSize = 0;
  var _itemCount = 1;
  var price = 49.999;
  var total = 49.999;

  void itemAdd() {
    setState(() {
      _itemCount++;
      total = price * _itemCount;
    });
  }

  void itemDel() {
    setState(() {
      _itemCount--;
      total = price * _itemCount;
    });
  }

  // totalPrice() {
  //   double total = 0;
  //   for (var item in _carts) {
  //     total += (item.quantity * item.product.price);
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(CupertinoIcons.chevron_left),
                ),
                Icon(CupertinoIcons.ellipsis_vertical),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Steak House',
              style: primaryTextStyle.copyWith(
                fontSize: 30,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Our very own! Smashed\nbeef burgers',
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 50),
            Image.asset('assets/hamburger2.png', width: 315),
          ],
        ),
      );
    }

    Widget buttonSize(int index, String text) {
      return Container(
        margin: EdgeInsets.only(right: 20),
        width: 60,
        height: 60,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                selectedSize == index ? primaryColor : Color(0xffF6F7FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            setState(() {
              selectedSize = index;
            });
          },
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: medium,
              color: selectedSize == index ? Colors.white : primaryTextColor,
            ),
          ),
        ),
      );
    }

    Widget size() {
      return Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size :',
              style: primaryTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                buttonSize(0, 'S'),
                buttonSize(1, 'M'),
                buttonSize(2, 'L'),
              ],
            )
          ],
        ),
      );
    }

    Widget quantity() {
      return Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity :',
              style: primaryTextStyle.copyWith(fontWeight: medium),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    itemDel();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F7FB),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(CupertinoIcons.minus),
                  ),
                ),
                Text(
                  '$_itemCount',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    itemAdd();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(CupertinoIcons.plus),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bottomBar() {
      return Container(
        margin: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price :',
                  style: secondaryTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(height: 9),
                Text(
                  'IDR $total',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffF6F7FB),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.favorite_outline),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    CupertinoIcons.bag,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          header(),
          content(),
          size(),
          quantity(),
          bottomBar(),
        ],
      ),
    );
  }
}
