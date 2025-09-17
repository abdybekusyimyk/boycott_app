class Product {
  final String id;
  final String name;
  final String description;
  final String type;
  final String website;
  final Logo logo;
  final List<Category> categories;
  final List<Alternative> alternatives;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.website,
    required this.logo,
    required this.categories,
    required this.alternatives,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      website: json['website'],
      logo: Logo.fromJson(json['logo']),
      categories: (json['categories'] as List)
          .map((c) => Category.fromJson(c))
          .toList(),
      alternatives: (json['alternatives'] as List)
          .map((a) => Alternative.fromJson(a))
          .toList(),
    );
  }
}

class Logo {
  final String type;
  final String url;

  Logo({required this.type, required this.url});

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(type: json['type'], url: json['url']);
  }
}

class Category {
  final String id;
  final String name;
  final String slug;

  Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name'], slug: json['slug']);
  }
}

class Alternative {
  final String id;
  final String name;
  final String description;
  final String website;
  final Logo logo;

  Alternative({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.logo,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) {
    return Alternative(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      website: json['website'],
      logo: Logo.fromJson(json['logo']),
    );
  }
}
