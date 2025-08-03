class WorkerModel {
  final int? id;
  final String name;
  final String jobTitle;
  final String imagePath;
  final double rating;
  final int? price;
  final String? description;

  const WorkerModel({
    this.id,
    required this.name,
    required this.jobTitle,
    required this.imagePath,
    required this.rating,
    this.price,
    this.description,
  });

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: json['id'] as int?,
      name: json['name'] ?? '',
      jobTitle: json['job_title'] ?? '',
      imagePath: json['image_url'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: json['price'],
      description: json['description'],
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkerModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          jobTitle == other.jobTitle &&
          imagePath == other.imagePath;

  @override
  int get hashCode =>
      name.hashCode ^ jobTitle.hashCode ^ imagePath.hashCode ^ rating.hashCode;
}
