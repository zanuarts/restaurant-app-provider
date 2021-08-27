import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant_detail.dart';

class CardReviews extends StatelessWidget {
  final CustomerReviews reviews;

  CardReviews({required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(reviews.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(reviews.date),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(reviews.review),
            ),
          ],
        ),
      ),
    );
  }
}
