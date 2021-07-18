import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurants restaurants;
  final restoPicture = 'https://restaurant-api.dicoding.dev/images/medium/';

  const CardRestaurant({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: Hero(
            tag: restaurants.pictureId,
            child: Image.network(
              restoPicture + restaurants.pictureId,
              width: 100,
            ),
          ),
          title: Text(
            restaurants.name,
          ),
          subtitle: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4, bottom: 2),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.0,
                    ),
                    Text(restaurants.city)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2, bottom: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16.0,
                    ),
                    Text(restaurants.rating)
                  ],
                ),
              )
            ],
          ),
          onTap: () => Navigator.pushNamed(
              context, RestaurantDetailPage.routeName,
              arguments: restaurants.id),
        ));
  }
}
