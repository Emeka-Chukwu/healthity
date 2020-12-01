import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/components/notification_cart.dart';
import 'package:healthify/features/pharmacies/screens/place_order.dart';

class DrugsCheckOut extends StatelessWidget {
  final int quantity;

  const DrugsCheckOut({Key key, this.quantity}) : super(key: key);
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
                  Text("CART"),
                ],
              ),
            ),
            CartCard(
              name: "Gentamycin",
              imageUrl: "assets/images/gentamycin_details.png",
              quantity: 1,
              price: 1570,
            ),
            StoreAddress(
              address:
                  "via Awolowo Road/Ijebu Bypass/Liebu Bypass and Ogunmola Street/A1",
            ),
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
            OrderDetailsButton(
              onTap: () => changeScreen(
                context,
                OrderPlacingPayment(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
