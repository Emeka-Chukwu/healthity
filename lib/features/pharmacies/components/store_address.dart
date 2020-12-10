import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthify/cores/cores.dart';

class StoreAddress extends StatelessWidget {
  final String address;

  const StoreAddress({Key key, @required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Responsive.screenWidth(2.5, context),
          horizontal: Responsive.screenWidth(2, context)),
      child: Padding(
        padding: EdgeInsets.only(left: Responsive.screenWidth(5, context)),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenHeight(2.5, context),
              horizontal: Responsive.screenWidth(2, context)),
          decoration: BoxDecoration(
              border: Border.all(
                  width: Responsive.screenWidth(0.2, context), color: purple),
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          child: Row(
            children: [
              Icon(
                Icons.add_location_alt_rounded,
                color: purple,
                size: Responsive.textSize(8, context),
              ),
              XMargin(Responsive.screenWidth(15, context)),
              Expanded(
                  child: Text(
                address,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w300,
                  color: black,
                  fontSize: Responsive.textSize(3.2, context),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderDetails extends StatelessWidget {
  final String title;
  final String description;
  final int amount;

  const OrderDetails(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.amount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Responsive.screenWidth(2.5, context),
          horizontal: Responsive.screenWidth(7, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: Responsive.textSize(3.2, context),
              height: Responsive.textSize(0.2, context),
              color: black,
            ),
          ),
          Text(
            description,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: Responsive.textSize(3.2, context),
              height: Responsive.textSize(0.2, context),
              color: darker,
            ),
          ),
          Text(
            "$amount",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: Responsive.textSize(3.2, context),
              height: Responsive.textSize(0.2, context),
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsTotal extends StatelessWidget {
  final String title;
  final int amount;

  const OrderDetailsTotal(
      {Key key, @required this.title, @required this.amount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Responsive.screenWidth(2.5, context),
          horizontal: Responsive.screenWidth(7, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: Responsive.textSize(3.2, context),
                height: Responsive.textSize(0.2, context),
                color: black,
              )),
          Text(
            "$amount",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: Responsive.textSize(3.2, context),
              height: Responsive.textSize(0.2, context),
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsButton extends StatelessWidget {
  final Function onTap;

  const OrderDetailsButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Responsive.screenWidth(88, context),
          height: Responsive.screenHeight(6.5, context),
          decoration: BoxDecoration(
              color: normalPurple,
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenWidth(2.5, context),
              horizontal: Responsive.screenWidth(7, context)),
          child: Text(
            "Checkout",
            style: GoogleFonts.lato(
              fontSize: Responsive.textSize(3.8, context),
              fontWeight: FontWeight.w500,
              height: Responsive.textSize(.2, context),
              color: white,
            ),
          )),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final Function onTap;

  const PaymentButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Responsive.screenWidth(88, context),
          height: Responsive.screenHeight(6, context),
          decoration: BoxDecoration(
              color: green,
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenWidth(2.5, context),
              horizontal: Responsive.screenWidth(7, context)),
          child: Text(
            "Place Order",
            style: TextStyle(color: white),
          )),
    );
  }
}

class ThanksButton extends StatelessWidget {
  final Function onTap;

  const ThanksButton({Key key, @required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Responsive.screenWidth(88, context),
          height: Responsive.screenHeight(6, context),
          decoration: BoxDecoration(
              color: normalPurple,
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenWidth(2.5, context),
              horizontal: Responsive.screenWidth(7, context)),
          child: Text(
            "Back to Home",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w500,
              fontSize: Responsive.textSize(3.8, context),
              height: Responsive.textSize(0.1, context),
              color: white,
            ),
          )),
    );
  }
}
