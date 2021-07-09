import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/local_restaurant.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantListPage extends StatelessWidget {

  static const routeName = '/restaurant_list_page';

  Widget _buildRestaurantItem(BuildContext context, Restaurants restaurant){
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        leading: Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                restaurant.pictureId,
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
        title: Text(restaurant.name),
        subtitle: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, bottom: 2),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 16.0,),
                  Text(restaurant.city)
                ],
              ),  
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, bottom: 4),
              child:Row(
                children: [
                  Icon(Icons.star, size: 16.0,),
                  Text(restaurant.rating)
                ],
              ),
            )
            
          ],
        ),
        onTap: (){
          Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: restaurant);
        },
      ),
    );
  }
  
  Widget _buildList(BuildContext context){
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
      builder: (context, snapshot){
        final List<Restaurants> restaurants = parseRestaurants(snapshot.data.toString());
        return ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index){
            return _buildRestaurantItem(context, restaurants[index]);
          }
        );
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