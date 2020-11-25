import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/screens/pharmacy_drugs.dart';

class PharmacyDetails extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String image;

  const PharmacyDetails(
      {Key key, this.id, this.name, this.description, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(image);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Responsive.screenHeight(45, context),
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
                    height: Responsive.constScreenHeight(38, context),
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
                            color: normalPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.textSize(7, context)),
                      ),
                      YMargin(Responsive.screenHeight(0.7, context)),
                      Text(
                        description,
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w300,
                            fontSize: Responsive.textSize(3.6, context)),
                      ),
                      YMargin(Responsive.screenHeight(7, context)),
                      Row(
                        children: [
                          Icon(
                            Icons.car_rental,
                            color: normalPurple,
                            size: Responsive.textSize(9, context),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Responsive.screenWidth(10, context)),
                              child: Text(
                                "via Awolowo Road/Ijebu Bypass/Liebu Bypass and Ogunmola Street/A1",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        Responsive.textSize(2.8, context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      YMargin(Responsive.constScreenHeight(3, context)),
                      Row(
                        children: [
                          Icon(
                            Icons.contact_phone,
                            color: normalPurple,
                            size: Responsive.textSize(9, context),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Responsive.screenWidth(10, context)),
                              child: Text(
                                "+2341930830303",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        Responsive.textSize(2.8, context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      YMargin(Responsive.constScreenHeight(3, context)),
                      Row(
                        children: [
                          Icon(
                            Icons.medical_services,
                            color: normalPurple,
                            size: Responsive.textSize(9, context),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Responsive.screenWidth(10, context)),
                              child: Text(
                                "180 drugs in stock",
                                style: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w300,
                                    fontSize:
                                        Responsive.textSize(2.8, context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      YMargin(Responsive.constScreenHeight(6, context)),
                      GestureDetector(
                        onTap: () => changeScreen(
                            context,
                            PharmacyStoreDrugs(
                              name: "Bicycle Pharmacy",
                            )),
                        child: Container(
                          alignment: Alignment.center,
                          height: Responsive.screenHeight(7, context),
                          width: Responsive.screenWidth(80, context),
                          decoration: BoxDecoration(
                            color: normalPurple,
                            borderRadius: BorderRadius.circular(
                                Responsive.screenWidth(1, context)),
                          ),
                          child: Text(
                            "View Store",
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
