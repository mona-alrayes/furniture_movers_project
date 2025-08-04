class EmployeeModel {
  final int id;
  final String name;
  final String jobTitle;
  final double rating;
  final String imageUrl;
  final int categoryId;
  final double price;
  final String description;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.imageUrl,
    required this.categoryId,
    required this.price,
    required this.description,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'] ?? '',
      jobTitle: json['job_title'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['image_url'] ?? '',
      categoryId: json['category_id'] ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? ' ',
    );
  }
}
