import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/models/local_restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurants restaurants;

  const RestaurantDetailPage({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Image.network(restaurants.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurants.name, style: myTextTheme.headline3),
                  Row(
                    children:[
                      Icon(Icons.location_on),
                      Text(restaurants.city, style: myTextTheme.subtitle1,)
                    ]
                  ),
                  SizedBox(height: 24,),
                  Text(
                    'Tentang Restaurant',
                    style: myTextTheme.bodyText1
                  ),
                  Text(restaurants.description, style: myTextTheme.bodyText2,),
                  SizedBox(height: 24,),
                  Text('Makanan', style: myTextTheme.bodyText1,),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var item in restaurants.menus.foods)
                          Card(
                              child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                              print(item.name);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 140.0,
                              child: Column(
                                children: [
                                  Image.asset('assets/images/fast-food.png',
                                      height: 80, fit: BoxFit.fitHeight),
                                  SizedBox(height: 8),
                                  Text(
                                    item.name,
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      ],
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text('Minuman', style: myTextTheme.bodyText1,),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var item in restaurants.menus.drinks)
                          Card(
                              child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              print('Card tapped.');
                              print(item.name);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 140.0,
                              child: Column(
                                children: [
                                  Image.asset('assets/images/fast-food.png',
                                      height: 80, fit: BoxFit.fitHeight),
                                  SizedBox(height: 8),
                                  Text(
                                    item.name,
                                    style: Theme.of(context).textTheme.button,
                                  ),
                                ],
                              ),
                            ),
                          )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}