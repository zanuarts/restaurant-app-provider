import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list_page';

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  Widget _buildList(BuildContext context){
    return Consumer<RestaurantListProvider>(
      builder: (context, state, _){
        if (state.state == ResultState.Loading){
          return Center(child: CircularProgressIndicator());
        }
        else if(state.state == ResultState.HasData){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index){
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(
                restaurants: restaurant,                
              );
            },
          );
        }
        else if(state.state == ResultState.NoData){
          return Center(child: Text(state.message));
        }
        else if(state.state == ResultState.Error){
          return Center(child: Text(state.message));
        }
        else{
          return Center(child: Text(''));
        }
      }
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