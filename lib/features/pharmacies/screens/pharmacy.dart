import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';
import 'package:healthify/features/authentication/repositories/repository.dart';
import 'package:healthify/features/authentication/screens/user_sign_in.dart';
import 'package:healthify/features/boarding/screen/get_started.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:healthify/features/pharmacies/screens/pharmacy_drugs.dart';

class PharmacyDetails extends StatelessWidget {
  final Data data;
  final String id;
  final String name;
  final String description;
  final String image;

  const PharmacyDetails(
      {Key key, this.id, this.name, this.description, this.image, this.data})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final logout = userInitialization;
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthUserBloc, AuthUserState>(
          cubit: logout,
          listener: (context, state) {
            if (state is AuthUserNotAuthenticated) {
              changeScreen(
                context,
                GetStarted(),
              );
            }
          },
          builder: (context, state) {
            redirectToLogin(context);

            Future.delayed(Duration(seconds: 2), () {
              // redirectToMainPage(context);
              // if (state is AuthUserNotAuthenticated) {
              //   changeScreen(
              //     context,
              //     UserSignIn(),
              //   );
              // }
            });

            return Container(
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
                          IconButton(
                              icon: Icon(Icons.logout),
                              onPressed: () => logout.add(
                                    LogoutUser(),
                                  )),
                          NotificationBell()
                        ],
                      ),
                      Image(
                        image: AssetImage(image),
                        height: Responsive.constScreenHeight(34, context),
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
                                fontSize: Responsive.textSize(5.5, context)),
                          ),
                          YMargin(Responsive.screenHeight(0.7, context)),
                          Text(
                            description ?? "description",
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
                                    data.address ?? "Address",
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
                                    "${data.phoneNumber ?? 08165955353}",
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
                                    "${data.inventory.length}",
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
                                  name: data.storeName,
                                  inventory: data.inventory,
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
            );
          },
        ),
      ),
    );
  }
}
