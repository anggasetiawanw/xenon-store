import 'package:equatable/equatable.dart';

class GalleryModel extends Equatable {
  final int id;
  final String url;

  const GalleryModel({
    this.id = 0,
    this.url = "",
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
  };

  @override
  List<Object> get props => [id, url];
}
