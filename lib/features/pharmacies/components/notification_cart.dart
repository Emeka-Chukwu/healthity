import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class NotificationCart extends StatelessWidget {
  int cartQuantity;
  NotificationCart({this.cartQuantity});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          size: Responsive.textSize(7, context),
          color: purple,
        ),
        Positioned(
          right: Responsive.screenWidth(.5, context),
          top: Responsive.constScreenHeight(0, context),
          child: Container(
            height: Responsive.screenHeight(2, context),
            width: Responsive.screenHeight(2, context),
            decoration: BoxDecoration(shape: BoxShape.circle, color: purple),
            child: Center(
              child: Text(
                "$cartQuantity",
                style: TextStyle(
                  color: white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
