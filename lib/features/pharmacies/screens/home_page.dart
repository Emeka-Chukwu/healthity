import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/screens/pharmacy.dart';
import '../components/components.dart';

class PharmacyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: Responsive.screenWidth(5, context),
              right: Responsive.screenWidth(1, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(Responsive.constScreenHeight(3, context)),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    XMargin(
                      Responsive.screenWidth(2, context),
                    ),
                    Text(
                      "Ibadan",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.textSize(2, context)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Hi,",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.textSize(4.4, context),
                          height: Responsive.textSize(0.3, context)),
                    ),
                    XMargin(Responsive.screenWidth(1, context)),
                    Expanded(
                        child: Text(
                      "Joshua Godspower Dalopo",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          height: Responsive.textSize(0.3, context),
                          fontSize: Responsive.textSize(4.4, context)),
                    )),
                    NotificationBell(),
                    XMargin(Responsive.screenWidth(6, context))
                  ],
                ),
                YMargin(Responsive.screenHeight(5, context)),
                Container(
                  height: Responsive.screenHeight(5, context),
                  width: Responsive.screenWidth(88, context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Responsive.screenWidth(2, context),
                      ),
                      color: lightPurple),
                  child: TextField(
                    onSubmitted: null,
                    decoration: InputDecoration(
                      hintText: "Search for Drugs",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                YMargin(Responsive.screenHeight(3, context)),
                Text(
                  "Popular Stores",
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontSize: Responsive.textSize(3.3, context)),
                ),
                YMargin(Responsive.screenHeight(3, context)),
                Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: () => changeScreen(
                            context,
                            PharmacyDetails(
                              name: "Bicycle Pharmacy",
                              description: "all drugs at affordable price",
                              image: "assets/images/pharmacy_image.png",
                            )),
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                      Stores(
                        name: "Bicycle Pharmacy",
                        description: "all drugs at affordable price",
                        image: "assets/images/pharmacy_image.png",
                        onTap: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
