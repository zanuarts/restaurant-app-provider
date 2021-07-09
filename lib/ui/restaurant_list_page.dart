import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/list_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list_page';

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {

  late Future<ListRestaurant> _listRestaurant;

  @override
  void initState(){
    super.initState();
    _listRestaurant = ApiService().listRestaurant();
  }
  

  Widget _buildList(BuildContext context){
    return FutureBuilder(
      future: _listRestaurant,
      builder: (context, AsyncSnapshot<ListRestaurant> snapshot){
        var state = snapshot.connectionState;
        if (state != ConnectionState.done){
          return Center(child: CircularProgressIndicator());
        }
        else{
          if(snapshot.hasData){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.restaurants.length,
              itemBuilder: (context, index){
                var restaurant = snapshot.data?.restaurants[index];
                return CardRestaurant(restaurants: restaurant!);
              },
            );
          }
          else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          else{
            return Text('');
          }
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Restaurants App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}