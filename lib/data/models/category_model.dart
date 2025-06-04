class Category {
  final String catName;

  Category({required this.catName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(catName: json['cat_name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'cat_name': catName,
    };
  }
}
