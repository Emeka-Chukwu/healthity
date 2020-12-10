import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/repositories/repository.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/screens/check_out.dart';

class DrugDetails extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String image;
  final int price;
  final int quantity;

  const DrugDetails(
      {Key key,
      this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.quantity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    redirectToLogin(context);

    print(image);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Responsive.screenHeight(33, context),
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(3, context),
                ),
                color: lightBlue,
                child: Column(children: [
                  YMargin(Responsive.screenHeight(2, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back),
                      ),
                      NotificationBell()
                    ],
                  ),
                  Image(
                    image: AssetImage(image),
                    height: Responsive.constScreenHeight(23, context),
                    fit: BoxFit.cover,
                  ),
                ]),
              ),
              YMargin(Responsive.screenHeight(5, context)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.screenWidth(10, context),
                  ),
                  width: double.infinity,
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: Responsive.textSize(6, context)),
                      ),
                      YMargin(Responsive.screenHeight(1.5, context)),
                      Text(
                        description,
                        style: TextStyle(
                            color: darkGray,
                            fontWeight: FontWeight.w300,
                            fontSize: Responsive.textSize(2.8, context)),
                      ),
                      YMargin(Responsive.screenHeight(1.5, context)),
                      Text(
                        "$quantity in stock",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.textSize(2.8, context)),
                      ),
                      YMargin(Responsive.screenHeight(2.5, context)),
                      Text(
                        "N ${Currency.format(price.toString())}",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.textSize(4.4, context)),
                      ),
                      YMargin(Responsive.screenHeight(1, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(2, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dosage form",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(3.6, context),
                                    fontWeight: FontWeight.w300,
                                    color: black,
                                  ),
                                ),
                                YMargin(Responsive.screenHeight(1, context)),
                                Text(
                                  "Pills",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(2.9, context),
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: Responsive.screenWidth(35, context),
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(2, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Active Substance",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(3.6, context),
                                    fontWeight: FontWeight.w300,
                                    color: black,
                                  ),
                                ),
                                YMargin(Responsive.screenHeight(1, context)),
                                Text(
                                  "Gentamycin",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(2.9, context),
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      // YMargin(Responsive.constScreenHeight(3, context)),
                      // YMargin(Responsive.screenHeight(3, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(2, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dosage",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(3.6, context),
                                    fontWeight: FontWeight.w300,
                                    color: black,
                                  ),
                                ),
                                YMargin(Responsive.screenHeight(1, context)),
                                Text(
                                  "0.2g",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(2.9, context),
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: Responsive.screenWidth(35, context),
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(2, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pharmacy Store",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(3.6, context),
                                    fontWeight: FontWeight.w300,
                                    color: black,
                                  ),
                                ),
                                YMargin(Responsive.screenHeight(1, context)),
                                Text(
                                  "Bicycle Pharmacy",
                                  style: TextStyle(
                                    fontSize: Responsive.textSize(2.9, context),
                                    fontWeight: FontWeight.w500,
                                    color: black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Responsive.screenWidth(5, context),
                                vertical: Responsive.screenHeight(.5, context)),
                            child: Container(
                              alignment: Alignment.center,
                              width: Responsive.screenWidth(30, context),
                              height: Responsive.screenHeight(4, context),
                              decoration: BoxDecoration(
                                  color: Color(0xffFDDDC6),
                                  borderRadius: BorderRadius.circular(
                                      Responsive.screenWidth(3, context))),
                              child: Text("View Store Details"),
                            ),
                          )),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.screenHeight(1, context)),
                            child: Container(
                              alignment: Alignment.center,
                              width: Responsive.screenWidth(23, context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Responsive.screenWidth(3, context))),
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Responsive.screenWidth(5, context))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: null,
                                    ),
                                    Text("3"),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      YMargin(Responsive.constScreenHeight(3, context)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              height: Responsive.screenHeight(7, context),
                              width: Responsive.screenWidth(23, context),
                              child: Card(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Responsive.screenWidth(2, context))),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: purple,
                                  size: Responsive.textSize(6, context),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => changeScreen(
                              context,
                              DrugsCheckOut(),
                            ),
                            // () => changeScreen(
                            //     context,
                            //     PharmacyStoreDrugs(
                            //       name: "Bicycle Pharmacy",
                            //     )),
                            child: Container(
                              alignment: Alignment.center,
                              height: Responsive.screenHeight(7, context),
                              width: Responsive.screenWidth(55, context),
                              decoration: BoxDecoration(
                                color: normalPurple,
                                borderRadius: BorderRadius.circular(
                                    Responsive.screenWidth(2, context)),
                              ),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Responsive.textSize(3.6, context),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
