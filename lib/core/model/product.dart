class Product {
  int? id;
  String? title, description, brand, category, thumbnail, rating, discountPercentage;
  int? price, stock;
  List<dynamic>? images = [];
  bool isLike = false;

  Product(
      {this.id,
      this.title,
      this.description,
      this.brand,
      this.category,
      this.thumbnail,
      this.price,
      this.stock,
      this.discountPercentage,
      this.rating,
      this.images,
      required this.isLike});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        price: json['price'],
        stock: json['stock'],
        discountPercentage: json['discountPercentage'].toString(),
        rating: json['rating'].toString(),
        images: json['images'] ?? [],
        isLike: false);
  }

  Product copyWith(
      {int? id,
      String? title,
      String? brand,
      String? description,
      String? category,
      String? thumbnail,
      String? rating,
      String? discountPercentage,
      int? price,
      int? stock,
      List<dynamic>? images,
      bool? isLike}) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      rating: rating ?? this.rating,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      price: price ?? this.price,
      stock: price ?? this.stock,
      images: images ?? this.images,
      isLike: isLike ?? this.isLike,
    );
  }
}
