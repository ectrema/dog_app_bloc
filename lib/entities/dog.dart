import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@JsonSerializable()
class Dog {
  String? imageLisk;
  String? name;
  String? details;

  Dog({
    this.imageLisk,
    this.name,
    this.details,
  });

  Dog copywith({
  String? imageLisk,
  String? name,
  String? details,  
  }) => Dog(
    imageLisk: imageLisk ?? this.imageLisk,
    name: name ?? this.name,
    details: details ?? this.details,
  );

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
  Map<String, dynamic> toJson() => _$DogToJson(this);
}