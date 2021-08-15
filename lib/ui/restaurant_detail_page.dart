import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/data/models/restaurant_detail.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant_detail';

  final Restaurants restaurants;

  const RestaurantDetailPage({required this.restaurants});

  @override
  RestaurantDetailPageState createState() => RestaurantDetailPageState();
}

class RestaurantDetailPageState extends State<RestaurantDetailPage> {
  final restoPicture = 'https://restaurant-api.dicoding.dev/images/medium/';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(
          apiService: ApiService(), id: widget.restaurants.id),
      child: Consumer<RestaurantDetailProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.HasData) {
            var resto = state.result.restaurant;
            return detailPage(context, resto);
          } else if (state.state == ResultState.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.Error) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }

  Widget detailPage(BuildContext context, Restaurant restaurant) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restoPicture + restaurant.pictureId),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name, style: myTextTheme.headline3),
                  Row(children: [
                    Icon(Icons.location_on),
                    Text(
                      restaurant.city,
                      style: myTextTheme.subtitle1,
                    )
                  ]),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Tentang Restaurant', style: myTextTheme.bodyText1),
                  Text(
                    restaurant.description,
                    style: myTextTheme.bodyText2,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Makanan',
                    style: myTextTheme.bodyText1,
                  ),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var item in restaurant.menus.foods)
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
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Minuman',
                    style: myTextTheme.bodyText1,
                  ),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var item in restaurant.menus.drinks)
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
                            ),
                          ),
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
