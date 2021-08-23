import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class CardRestaurant extends StatefulWidget {
  final Restaurants restaurants;

  const CardRestaurant({required this.restaurants});

  @override
  _CardRestaurantState createState() => _CardRestaurantState();
}

class _CardRestaurantState extends State<CardRestaurant> {
  final restoPicture = 'https://restaurant-api.dicoding.dev/images/medium/';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: widget.restaurants.pictureId,
          child: Image.network(
            restoPicture + widget.restaurants.pictureId,
            width: 100,
          ),
        ),
        title: Text(
          widget.restaurants.name,
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
                  Text(widget.restaurants.city)
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
                  Text(widget.restaurants.rating)
                ],
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: widget.restaurants.id);
        },
      ),
    );
  }
}
