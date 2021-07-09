// import 'dart:convert';

// class LocalRestaurant{
//   List<Restaurants> restaurants;
  
//   LocalRestaurant({
//     required this.restaurants
//   });

//   factory LocalRestaurant.fromJson(Map<String, dynamic> localRestaurant){
//     return LocalRestaurant(
//       restaurants: localRestaurant['restaurants']
//     );
//   }
// }

// List<LocalRestaurant> parseLocalRestaurants(String json){
//   if (json == null){
//     return [];
//   }
//   final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
//   return parsed.map<LocalRestaurant>((json) => LocalRestaurant.fromJson(json)).toList();
// }

// class Restaurants{
//   final String id;
//   final String name;
//   final String description;
//   final String pictureId;
//   final String city;
//   final String rating;
//   final Menus menus;

//   Restaurants({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.rating,
//     required this.menus
//   });

//   factory Restaurants.fromJson(Map<String, dynamic>json){
//     return Restaurants(
//       id: json['id'] as String,
//       name: json['name'] as String,
//       description: json['description'] as String,
//       pictureId: json['pictureId'] as String,
//       city: json['city'] as String,
//       rating: json['rating'].toString(),
//       menus: Menus.fromJson(json['menus']),
//     );
//   }
// }

// List<Restaurants> parseRestaurants(String json){
//   if (json == null){
//     return [];
//   }
//   final parsed = jsonDecode(json)['restaurants'];
//   return parsed.map<Restaurants>((json) => Restaurants.fromJson(json)).toList();
// }

// class Menus{
//   List<Foods> foods;
//   List<Drinks> drinks;

//   Menus({
//     required this.foods,
//     required this.drinks
//   });

//   factory Menus.fromJson(Map<String, dynamic> json){
//     var foods = json['foods'] as List;
//     List<Foods> foodList = foods.map((i) => Foods.fromJson(i)).toList();
//     var drinks = json['drinks'] as List;
//     List<Drinks> drinkList = drinks.map((i) => Drinks.fromJson(i)).toList();
//     return Menus(
//       foods: foodList,
//       drinks: drinkList
//     );
//   }
// }

// // List<Menus> parseMenus(String json){
// //   if (json == null){
// //     return [];
// //   }

// //   final parsed = jsonDecode(json).cast<Map<String, dynamic>>();
// //   return parsed.map<Menus>((json) => Menus.fromJson(json)).toList();
// // }



// class Foods{
//   final String name;

//   Foods({
//     required this.name
//   });

//   factory Foods.fromJson(Map<String, dynamic> json){
//     return Foods(
//       name: json['name']
//     );
//   }
// }

// List<Foods> parseFoods(String json){
//   if (json == null){
//     return [];
//   }
//   final List parsed = jsonDecode(json)['menus'];
//   return parsed.map((json) => Foods.fromJson(json)).toList();
// }
// class Drinks{
//   final String name;

//   Drinks({
//     required this.name
//   });

//   factory Drinks.fromJson(Map<String, dynamic> json){
//     return Drinks(
//       name: json['name']
//     );
//   }
// }

// List<Drinks> parseDrinks(String json){
//   if (json == null){
//     return [];
//   }

//   final List parsed = jsonDecode(json) ['menus'];
//   return parsed.map((json) => Drinks.fromJson(json)).toList();
// }