import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class Drugs extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final Function onTap;
  final String price;

  const Drugs(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.image,
      @required this.onTap,
      this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(40, context),
      margin: EdgeInsets.only(
        bottom: Responsive.screenHeight(2, context),
        top: Responsive.screenHeight(2, context),
        left: Responsive.screenHeight(.2, context),
        right: Responsive.screenHeight(3.5, context),
      ),
      decoration: BoxDecoration(
        color: lightPurple,
        borderRadius: BorderRadius.circular(
          Responsive.screenWidth(5, context),
        ),
      ),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(Responsive.screenWidth(5, context))),
        child: Column(children: [
          YMargin(Responsive.screenHeight(3, context)),
          Image(
            image: AssetImage(image),
            height: Responsive.screenHeight(15, context),
            fit: BoxFit.cover,
          ),
          YMargin(Responsive.screenHeight(1, context)),
          Text(
            name,
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w700,
                fontSize: Responsive.textSize(2.8, context)),
          ),
          YMargin(Responsive.screenHeight(.5, context)),
          Text(
            description,
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w300,
                fontSize: Responsive.textSize(2, context)),
          ),
          YMargin(Responsive.screenHeight(.5, context)),
          Text(
            "N${Currency.format(price.toString())}",
            style: TextStyle(
                color: black,
                fontWeight: FontWeight.w600,
                fontSize: Responsive.textSize(2.4, context)),
          ),
          YMargin(Responsive.screenHeight(2, context)),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: Responsive.screenHeight(5.5, context),
              width: Responsive.screenWidth(30, context),
              decoration: BoxDecoration(
                color: cyan,
                borderRadius: BorderRadius.circular(
                  Responsive.screenWidth(3, context),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Details",
                    style: TextStyle(
                        color: darkPurple,
                        fontWeight: FontWeight.w700,
                        fontSize: Responsive.textSize(2.4, context)),
                    textAlign: TextAlign.center,
                  )),
                  // Icon(
                  //   Icons.arrow_forward_ios_outlined,
                  //   color: white,
                  // ),
                  // XMargin(Responsive.screenWidth(1, context))
                ],
              ),
            ),
          ),
          YMargin(Responsive.screenHeight(2, context)),
        ]),
      ),
    );
  }
}
