class ServiceModel {
  final int id;
  final String title;
  final String imageUrl;

  ServiceModel({required this.id, required this.title, required this.imageUrl});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}
