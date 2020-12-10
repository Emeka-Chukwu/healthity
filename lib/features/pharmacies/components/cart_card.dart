import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              width: Responsive.screenWidth(30, context),
              fit: BoxFit.cover,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.8, context),
                      height: Responsive.textSize(.25, context),
                    ),
                  ),
                  YMargin(Responsive.screenHeight(2, context)),
                  Row(
                    children: [
                      Text(
                        "N ${Currency.format(price.toString())}",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w400,
                          fontSize: Responsive.textSize(3.2, context),
                          height: Responsive.textSize(.3, context),
                          color: Color(0xff615c5c),
                        ),
                      ),
                      XMargin(
                        Responsive.screenWidth(2.5, context),
                      ),
                      Text(
                        " x $quantity",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.w600,
                          fontSize: Responsive.textSize(3.2, context),
                          height: Responsive.textSize(.3, context),
                          color: Color(0xff615c5c),
                        ),
                      ),
                    ],
                  ),
                  YMargin(Responsive.screenHeight(.7, context)),
                  Container(
                      child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive.screenHeight(.5, context),
                        ),
                        width: Responsive.screenWidth(25, context),
                        decoration: BoxDecoration(
                          color: orangeYellow,
                          borderRadius: BorderRadius.circular(
                            Responsive.screenWidth(2, context),
                          ),
                        ),
                        child: Text(
                          "Remove Drug",
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: Responsive.textSize(2.8, context),
                            color: redVariant,
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.location_on_outlined,
                            size: Responsive.textSize(5.5, context),
                            color: Color(0xff3F1497),
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
                      icon: Icon(
                        Icons.remove,
                        color: black,
                      ),
                      onPressed: null,
                    ),
                    Text(
                      "3",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: Responsive.textSize(2.8, context),
                        color: black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: black,
                      ),
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
