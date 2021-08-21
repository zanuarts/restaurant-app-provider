import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/search_restaurant.dart';
import 'dart:async';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({required this.apiService, required String query}) {
    _fecthRestaurantSearch(query);
  }

  late SearchRestaurant _restaurantSearch;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  SearchRestaurant get result => _restaurantSearch;
  ResultState get state => _state;

  Future<dynamic> _fecthRestaurantSearch(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restoSearch = await apiService.searchRestaurant(query);
      if (restoSearch.error.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        print(restoSearch);
        return _restaurantSearch = restoSearch;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error ---> $e";
    }
  }
}
