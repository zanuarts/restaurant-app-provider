import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/models/local_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/ui/restaurant_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: myTextTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          textTheme: myTextTheme.apply(bodyColor: Colors.black),
          elevation: 0
        ),
      ),
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          restaurants: ModalRoute.of(context)?.settings.arguments as Restaurants,
        )
      }
    );
  }
}