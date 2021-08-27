import 'package:flutter/material.dart';

<<<<<<< HEAD
class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
=======
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
>>>>>>> b470986ea32f546a03d9787a973bb692dc14425d
  }
}
