import 'dart:convert';

class SearchRestaurant {
  final String error;
  final String founded;
  List<Restaurants> restaurants;

  SearchRestaurant({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchRestaurant.fromJson(Map<String, dynamic> json) {
    var resto = json['restaurants'] as List;
    List<Restaurants> restoSearch =
        resto.map((i) => Restaurants.fromJson(i)).toList();
    return SearchRestaurant(
        error: json['error'].toString(),
        founded: json['founded'].toString(),
        restaurants: restoSearch);
  }
}

List<Restaurants> parseSearchRestaurants(String json) {
  final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
  return parsed
      .map<SearchRestaurant>((json) => SearchRestaurant.fromJson(json))
      .toList();
}

class Restaurants {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;

  Restaurants(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});

  factory Restaurants.fromJson(Map<String, dynamic> json) {
    return Restaurants(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        pictureId: json['pictureId'] as String,
        city: json['city'] as String,
        rating: json['rating'].toString());
  }
}

List<Restaurants> parseRestaurants(String json) {
  final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
  return parsed.map<Restaurants>((json) => Restaurants.fromJson(json)).toList();
}
