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
}