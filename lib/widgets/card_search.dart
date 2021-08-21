import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/search_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';

class CardSearch extends StatefulWidget {
  final Restaurants resto;

  const CardSearch({required this.resto});

  @override
  _CardSearchState createState() => _CardSearchState();
}

class _CardSearchState extends State<CardSearch> {
  final restoPicture = 'https://restaurant-api.dicoding.dev/images/medium/';

  @override
  Widget build(BuildContext context) {
    print(widget.resto);
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: widget.resto.pictureId,
          child: Image.network(
            restoPicture + widget.resto.pictureId,
            width: 100,
          ),
        ),
        title: Text(widget.resto.name),
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
                  Text(widget.resto.city),
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
                  Text(widget.resto.rating),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: widget.resto.id);
        },
      ),
    );
  }
}
