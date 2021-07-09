
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

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
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: secondaryColor,
            textStyle: TextStyle(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0)
              )
            )
          )
        )
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
          restaurants: ModalRoute.of(context)?.settings.arguments as Restaurants,
        )
      }
    );
  }
}