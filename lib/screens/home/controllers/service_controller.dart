import 'dart:convert';
import 'package:http/http.dart' as http;

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

class ServiceController {
  final String _url = 'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/main_services';

  final Map<String, String> _headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Accept': 'application/json',
  };

  Future<List<ServiceModel>> fetchServices() async {
    final response = await http.get(Uri.parse(_url), headers: _headers);

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((item) => ServiceModel.fromJson(item)).toList();
    } else {
      throw Exception('فشل في تحميل الخدمات');
    }
  }
}
