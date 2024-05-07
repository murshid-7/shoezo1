import 'package:hive_flutter/hive_flutter.dart';
part 'cart_model.g.dart';
@HiveType(typeId: 2)
class CartModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String price;
  @HiveField(4)
  final int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
