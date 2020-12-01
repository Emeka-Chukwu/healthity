import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class CartCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  int quantity;

  CartCard(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.price,
      @required this.quantity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(90, context),
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Responsive.screenWidth(2, context),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(imageUrl),
              width: Responsive.screenWidth(25, context),
              fit: BoxFit.cover,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Row(
                    children: [
                      Text("N ${Currency.format(price.toString())}"),
                      Text(" x $quantity"),
                    ],
                  ),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Responsive.screenWidth(25, context),
                        decoration: BoxDecoration(
                          color: orangeYellow,
                          borderRadius: BorderRadius.circular(
                            Responsive.screenWidth(2, context),
                          ),
                        ),
                        child: Text(
                          "Remove Drug",
                          style: TextStyle(color: redVariant),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.location_on_outlined,
                            size: Responsive.textSize(5.5, context),
                          ),
                          onPressed: null),
                    ],
                  )),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                right: Responsive.screenWidth(5, context),
              ),
              height: Responsive.screenWidth(23, context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Responsive.screenWidth(3, context))),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        Responsive.screenWidth(5, context))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ],
        ),
      ),
    );
  }
}
