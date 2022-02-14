import 'package:equatable/equatable.dart';
import 'package:xenon_store/models/category_model.dart';
import 'package:xenon_store/models/gallery_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final int price;
  final String description;
  final CategoryModel category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  List<GalleryModel> galleries;

  ProductModel({
    this.id = 0,
    this.name = '',
    this.price = 0,
    required this.description,
    required this.category,
    this.createdAt = null,
    this.updatedAt = null,
    this.galleries = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        category:
            CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        galleries: json['galleries']
            .map<GalleryModel>(
                (e) => GalleryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'category': category.toJson(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'galleries': galleries.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object> get props => [
        id,
        name,
        price,
        description,
        category,
        galleries,
      ];
}
