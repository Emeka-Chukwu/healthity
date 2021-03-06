import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:healthify/features/pharmacies/screens/drugs_details.dart';
import '../components/components.dart';

class PharmacyStoreDrugs extends StatelessWidget {
  final String name;
  final List<Inventory> inventory;

  const PharmacyStoreDrugs({
    Key key,
    @required this.name,
    @required this.inventory,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(inventory);
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: Responsive.textSize(5, context)),
                    ),
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
                  "Popular Drugs",
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
                      children: inventory.length > 0
                          ? inventory
                              .map(
                                (e) => Drugs(
                                  name: e.itemName,
                                  description: e.activeIngredients,
                                  price: e.pricePerUnit,
                                  image: e.image,
                                  onTap: () => changeScreen(
                                    context,
                                    DrugDetails(
                                      name: e.itemName,
                                      description: "Tablet 50pieces",
                                      image: e.image,
                                      price: e.pricePerUnit,
                                      quantity: e.quantity,
                                      activeSubstance: e.activeIngredients,
                                      storeName: name,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [
                              Container(
                                child: Center(
                                    child: Text("No drug in this store yet",
                                        style: TextStyle(
                                          color: red,
                                        ))),
                              ),
                            ]
                      // Drugs(
                      //   name: "Bicycle Pharmacy",
                      //   description: "all drugs at affordable price",
                      //   image: "assets/images/gentamycin.png",
                      //   price: 15000000.toString(),
                      //   onTap: () => changeScreen(
                      //     context,
                      // DrugDetails(
                      //   name: "Gentamycin",
                      //   description: "Tablet 50pieces",
                      //   image: "assets/images/gentamycin_details.png",
                      //   price: 1570,
                      //   quantity: 45,
                      // ),
                      //   ),
                      // ),
                      //   Drugs(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/gentamycin.png",
                      //     price: 1500.toString(),
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      //   Stores(
                      //     name: "Bicycle Pharmacy",
                      //     description: "all drugs at affordable price",
                      //     image: "assets/images/pharmacy_image.png",
                      //     onTap: null,
                      //   ),
                      // ],
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
