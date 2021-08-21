import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/widgets/card_search.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

class RestaurantSearchPage extends StatefulWidget {
  static const routeName = '/restaurant_search_page';

  final String query;

  const RestaurantSearchPage({required this.query});

  @override
  _RestaurantSearchPageState createState() => _RestaurantSearchPageState();
}

class _RestaurantSearchPageState extends State<RestaurantSearchPage> {
  Widget _buildList(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => RestaurantSearchProvider(
          apiService: ApiService(), query: widget.query),
      child: Consumer<RestaurantSearchProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            print(state.state);
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultState.HasData) {
            print(state.result.founded);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var resto = state.result.restaurants[index];

                return CardSearch(resto: resto);
              },
            );
          } else if (state.state == ResultState.NoData) {
            print(state.state);
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultState.Error) {
            print(state.state);
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Search Result'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
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
