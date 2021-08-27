import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/navigation.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class CardRestaurant extends StatefulWidget {
  final Restaurants restaurants;

  const CardRestaurant({
    required this.restaurants,
  });

  @override
  _CardRestaurantState createState() => _CardRestaurantState();
}

class _CardRestaurantState extends State<CardRestaurant> {
  final restoPicture = 'https://restaurant-api.dicoding.dev/images/medium/';

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isFavorited(widget.restaurants.id),
          builder: (context, snapshot) {
            var isFavorited = snapshot.data ?? false;
            return Material(
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
                trailing: isFavorited
                    ? IconButton(
                        onPressed: () =>
                            provider.removeFavorite(widget.restaurants.id),
                        icon: Icon(Icons.favorite),
                        color: Theme.of(context).accentColor)
                    : IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Theme.of(context).accentColor,
                        onPressed: () =>
                            provider.addFavorites(widget.restaurants),
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
                onTap: () => Navigation.intentWithData(
                    RestaurantDetailPage.routeName, widget.restaurants.id),
              ),
            );
          });
    });
  }
}
