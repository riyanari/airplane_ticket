import 'package:equatable/equatable.dart';

class DestinationsModel extends Equatable{

  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  final int price;

  DestinationsModel({
    required this.id,
    this.name = '',
    this.city = '',
    this.imageUrl = '',
    this.rating = 0.0,
    this.price = 0
  });

  factory DestinationsModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationsModel(
          id: id,
          name: json['name'],
          city: json['city'],
          imageUrl: json['imageUrl'],
          rating: json['rating'].toDouble(),
          price: json['price']
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'city': city,
    'imageUrl': imageUrl,
    'rating': rating,
    'price': price
  };

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, city, imageUrl, rating, price];


}