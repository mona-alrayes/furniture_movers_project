class WorkerModel {
  final String id;
  final String name;
  final String jobTitle;
  final String imagePath;
  final double rating;
  final int? price;
  final String? description;

  const WorkerModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.imagePath,
    required this.rating,
    this.price,
    this.description,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      jobTitle: json['job_title'] ?? '',
      imagePath: json['image_url'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: json['price'],
      description: json['description'],
    );
  }
}
