import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/components/notification_cart.dart';
import 'package:healthify/features/pharmacies/screens/thanks.dart';

class OrderPlacingPayment extends StatelessWidget {
  final int quantity;

  const OrderPlacingPayment({Key key, this.quantity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.screenWidth(3, context),
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(Responsive.screenHeight(2, context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back),
                      ),
                      NotificationCart(
                        cartQuantity: 2,
                      )
                    ],
                  ),
                  YMargin(Responsive.screenWidth(8, context)),
                  Text(
                    "PAYMENT",
                    style: GoogleFonts.lato(
                        fontSize: Responsive.textSize(3.8, context),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            YMargin(Responsive.screenWidth(8, context)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(8, context)),
              child: Row(
                children: [
                  Text(
                    "Card Number",
                    style: GoogleFonts.karla(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.2, context),
                      height: Responsive.textSize(0.2, context),
                      color: darkerGrey,
                    ),
                  ),
                ],
              ),
            ),
            YMargin(Responsive.screenWidth(2, context)),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(3, context)),
              alignment: Alignment.center,
              height: Responsive.screenHeight(10, context),
              width: Responsive.screenWidth(88, context),
              decoration: BoxDecoration(
                color: lightGreayTransparent,
                borderRadius: BorderRadius.circular(
                  Responsive.screenWidth(2, context),
                ),
              ),
              child: Row(
                children: [
                  Image(
                      image: AssetImage(
                    "assets/images/Mastercard.png",
                  )),
                  XMargin(Responsive.screenWidth(5, context)),
                  Text(
                    "****",
                    style: GoogleFonts.lato(
                      fontSize: Responsive.textSize(3.5, context),
                      fontWeight: FontWeight.w900,
                      height: Responsive.textSize(0.2, context),
                    ),
                  ),
                  XMargin(Responsive.screenWidth(3, context)),
                  Text(
                    "****",
                    style: GoogleFonts.lato(
                      fontSize: Responsive.textSize(3.5, context),
                      fontWeight: FontWeight.w900,
                      height: Responsive.textSize(0.2, context),
                    ),
                  ),
                  XMargin(Responsive.screenWidth(3, context)),
                  Text(
                    "****",
                    style: GoogleFonts.lato(
                      fontSize: Responsive.textSize(3.5, context),
                      fontWeight: FontWeight.w900,
                      height: Responsive.textSize(0.2, context),
                    ),
                  ),
                  XMargin(Responsive.screenWidth(3, context)),
                  Text(
                    "5488",
                    style: GoogleFonts.lato(
                      fontSize: Responsive.textSize(3.5, context),
                      fontWeight: FontWeight.w400,
                      height: Responsive.textSize(0.2, context),
                    ),
                  )
                ],
              ),
            ),
            YMargin(Responsive.screenHeight(5, context)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(8, context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expiration",
                    style: GoogleFonts.karla(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.2, context),
                      height: Responsive.textSize(0.2, context),
                      color: darkerGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: Responsive.screenWidth(3, context)),
                    child: Text(
                      "CVC",
                      style: GoogleFonts.karla(
                        fontWeight: FontWeight.w400,
                        fontSize: Responsive.textSize(3.2, context),
                        height: Responsive.textSize(0.2, context),
                        color: darkerGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            YMargin(Responsive.screenWidth(2, context)),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(4, context)),
              alignment: Alignment.center,
              height: Responsive.screenHeight(10, context),
              width: Responsive.screenWidth(88, context),
              decoration: BoxDecoration(
                color: lightGreayTransparent,
                borderRadius: BorderRadius.circular(
                  Responsive.screenWidth(2, context),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "MM / YY",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.2, context),
                      height: Responsive.textSize(0.2, context),
                      color: darker,
                    ),
                  ),
                  Text(
                    "876",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.2, context),
                      height: Responsive.textSize(0.2, context),
                      color: darker,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            YMargin(Responsive.screenHeight(6.5, context)),
            OrderDetails(
              title: "SubTotal",
              description: "x2 N1570",
              amount: 3140,
            ),
            OrderDetails(
              title: "Shipping",
              description: "4 hours",
              amount: 1570,
            ),
            OrderDetailsTotal(
              title: "Order Total",
              amount: 4710,
            ),
            YMargin(Responsive.screenWidth(15, context)),
            PaymentButton(
              onTap: () => changeScreen(
                context,
                ThanksScreen(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
