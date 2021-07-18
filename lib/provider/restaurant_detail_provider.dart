import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_detail.dart';
import 'dart:async';

enum ResultState{ Loading, NoData, HasData, Error}

class RestaurantDetailProvider extends ChangeNotifier{
  final ApiService apiService;

  RestaurantDetailProvider({required this.apiService}){
    _fetchRestaurantDetail();
  }

  late RestaurantDetail _restaurantDetail;
  late ResultState _state;
  String _message = '';

  String get message => _message;
  RestaurantDetail get result => _restaurantDetail;
  ResultState get state => _state;

  Future<dynamic> _fetchRestaurantDetail() async{
    try{
      _state = ResultState.Loading;
      notifyListeners();
      final restoDetail = await apiService.detailRestaurant();
      if (restoDetail.error.isEmpty){
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      }
      else{
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantDetail = restoDetail;
      }
    }
    catch(e){
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Error --> $e";
    }
  }
}