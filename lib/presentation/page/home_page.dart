import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/utility.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: ConstantsData.primaryorangcolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Utility.customeSizebox(height: size.height * 0.08),
            RichText(
                textScaleFactor: 1,
                text: TextSpan(
                    text: ConstantsData.splashNamep,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: ConstantsData.splashSales,
                          style:
                              TextStyle(color: ConstantsData.blackcommancolor))
                    ])),
            Align(
              heightFactor: 0,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Text(
                  ConstantsData.lableEnd,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Utility.customeSizebox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                homePageTab(size, ConstantsData.shoplable,
                    Icons.shopping_cart_outlined),
                homePageTab(size, ConstantsData.myacclable,
                    Icons.account_circle_outlined),
              ],
            ),
            Utility.customeSizebox(height: 30),
            Text(ConstantsData.fproductlable,
                style: TextStyle(
                    color: ConstantsData.whitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800)),
            Utility.customeSizebox(height: 30),
            Form(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: "Enter a Search term",
                          hintStyle: TextStyle(
                              color: ConstantsData.blackcommancolor
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.w500),
                          prefixIcon: Icon(
                            Icons.search,
                            color: ConstantsData.primaryorangcolor,
                            size: 35,
                          ),
                          filled: true,
                          fillColor: Colors.white),
                    ))),
            Utility.customeSizebox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ConstantsData.blackcommancolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(size.width, 50)),
                onPressed: () {},
                child: Text(ConstantsData.serchlbl))
          ]),
        ),
      ),
    );
  }

  Container homePageTab(Size size, String lable, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConstantsData.blackcommancolor,
      ),
      width: size.width * 0.4,
      height: size.width * 0.4,
      child: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
            ),
            Text(lable,
                style: TextStyle(
                    color: ConstantsData.whitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800))
          ],
        ),
        onPressed: () {},
        iconSize: 80,
        color: ConstantsData.whitecolor,
      ),
    );
  }
}
