import 'package:flutter/material.dart';
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
              Expanded(child: Text(address)),
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
          Text(title),
          Text(description),
          Text("$amount"),
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
          Text(title),
          Text("$amount"),
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
          height: Responsive.screenHeight(6, context),
          decoration: BoxDecoration(
              color: purple,
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenWidth(2.5, context),
              horizontal: Responsive.screenWidth(7, context)),
          child: Text(
            "Checkout",
            style: TextStyle(color: white),
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
              color: purple,
              borderRadius:
                  BorderRadius.circular(Responsive.screenWidth(2, context))),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: Responsive.screenWidth(2.5, context),
              horizontal: Responsive.screenWidth(7, context)),
          child: Text(
            "Back to Home",
            style: TextStyle(color: white),
          )),
    );
  }
}
