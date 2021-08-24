import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favorite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Anda belum menambahkan favorite'),
      ),
    );
  }
}
