import 'dart:convert';

import 'package:restaurant_app/data/models/list_restaurant.dart';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/restaurant_detail.dart';
import 'package:restaurant_app/data/models/search_restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  http.Client client;

  ApiService(this.client);

  Future<ListRestaurant> listRestaurant() async {
    final response = await client.get(Uri.parse(_baseUrl + 'list'));
    if (response.statusCode == 200) {
      return ListRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list restaurants');
    }
  }

  Future<RestaurantDetail> detailRestaurant(String id) async {
    final response = await client.get(Uri.parse(_baseUrl + 'detail/' + id));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<SearchRestaurant> searchRestaurant(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));
    if (response.statusCode == 200) {
      return SearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data search restaurant');
    }
  }
}
