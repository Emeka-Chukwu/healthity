import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/repositories/repository.dart';
import 'package:healthify/features/pharmacies/blocs/pharmacy_bloc.dart';
import 'package:healthify/features/pharmacies/screens/pharmacy.dart';
import 'package:healthify/features/pharmacies/screens/search_details.dart';
import '../components/components.dart';
import 'drugs_details.dart';

class PharmacyStore extends StatefulWidget {
  @override
  _PharmacyStoreState createState() => _PharmacyStoreState();
}

class _PharmacyStoreState extends State<PharmacyStore> {
  final pharmacy = PharmacyBloc();

  @override
  void initState() {
    pharmacy.add(FetchPharmacy());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // redirectToLogin(context);
    // pharmacy.add(FetchSearch(searchText: "paracetamol"));

    return Scaffold(
      backgroundColor: lightWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: Responsive.screenWidth(5, context),
              right: Responsive.screenWidth(1, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(Responsive.constScreenHeight(3, context)),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    XMargin(
                      Responsive.screenWidth(2, context),
                    ),
                    Text(
                      "Ibadan",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.textSize(2, context)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Hi,",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w300,
                          fontSize: Responsive.textSize(4.4, context),
                          height: Responsive.textSize(0.3, context)),
                    ),
                    XMargin(Responsive.screenWidth(1, context)),
                    Expanded(
                        child: Text(
                      "Joshua Godspower Dalopo",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                          height: Responsive.textSize(0.3, context),
                          fontSize: Responsive.textSize(4.4, context)),
                    )),
                    NotificationBell(),
                    XMargin(Responsive.screenWidth(6, context))
                  ],
                ),
                YMargin(Responsive.screenHeight(5, context)),
                BlocBuilder<PharmacyBloc, PharmacyState>(
                    cubit: pharmacy,
                    builder: (context, state) {
                      return Container(
                        height: Responsive.screenHeight(5, context),
                        width: Responsive.screenWidth(88, context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Responsive.screenWidth(2, context),
                            ),
                            color: lightPurple),
                        child: TextField(
                          onSubmitted: (value) {
                            print(value);
                            pharmacy.add(FetchSearch(searchText: value));
                          },
                          decoration: InputDecoration(
                            hintText: "Search for Drugs",
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ),
                      );
                    }),
                YMargin(Responsive.screenHeight(3, context)),
                Text(
                  "Popular Stores",
                  style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w600,
                      fontSize: Responsive.textSize(3.3, context)),
                ),
                YMargin(Responsive.screenHeight(3, context)),
                BlocConsumer<PharmacyBloc, PharmacyState>(
                  cubit: pharmacy,
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SearchLoaded) {
                      final data = state.inventorySearch;
                      return Container(
                        alignment: Alignment.center,
                        child: data.length > 0
                            ? Wrap(
                                direction: Axis.horizontal,
                                children: data
                                    .map((e) => DrugsTwo(
                                          image: e.image,
                                          name: e.itemName,
                                          description: e.address,
                                          price: e.pricePerUnit,
                                          onTap: () => changeScreen(
                                            context,
                                            DrugDetailsTwo(
                                              name: e.itemName,
                                              description: "Tablet 50pieces",
                                              image: e.image,
                                              price: e.pricePerUnit,
                                              quantity: e.quantity.numberInt,
                                              activeSubstance:
                                                  e.activeIngredients,
                                              storeName: e.name,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              )
                            : Center(
                                child: Text("No drug matched your search")),
                      );
                    }
                    if (state is PharmacyLoaded) {
                      final data = state.pharmacy.data;
                      print(data);
                      print(state);
                      print(state.pharmacy);
                      return Container(
                        alignment: Alignment.center,
                        child: Wrap(
                            direction: Axis.horizontal,
                            children: data
                                .map((element) => Stores(
                                      name: element.storeName,
                                      description: element.address ??
                                          "Unverified address or No Address yet",
                                      image: "assets/images/pharmacy_image.png",
                                      onTap: () => changeScreen(
                                          context,
                                          PharmacyDetails(
                                            name: element.storeName,
                                            description:
                                                "all drugs at affordable price",
                                            image:
                                                "assets/images/pharmacy_image.png",
                                            data: element,
                                          )),
                                    ))
                                .toList()
                            // Stores(
                            //   name: "Bicycle Pharmacy",
                            //   description: "all drugs at affordable price",
                            //   image: "assets/images/pharmacy_image.png",
                            //   onTap: () => changeScreen(
                            //       context,
                            //       PharmacyDetails(
                            //         name: "Bicycle Pharmacy",
                            //         description:
                            //             "all drugs at affordable price",
                            //         image: "assets/images/pharmacy_image.png",
                            //       )),
                            // ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            //   Stores(
                            //     name: "Bicycle Pharmacy",
                            //     description: "all drugs at affordable price",
                            //     image: "assets/images/pharmacy_image.png",
                            //     onTap: null,
                            //   ),
                            // ],
                            ),
                      );
                    }
                    return Container(
                      child: Column(
                        children: [
                          Text("Data loading"),
                          YMargin(Responsive.constScreenHeight(3, context)),
                          Center(
                              child: CircularProgressIndicator(
                            backgroundColor: green,
                          )),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
