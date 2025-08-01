import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Service {
  final int id;
  final String title;
  final String imageUrl;

  Service({required this.id, required this.title, required this.imageUrl});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}

class ServicesController with ChangeNotifier {
  final Dio _dio = Dio();

  List<Service> _services = [];
  bool _isLoading = false;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _dio.get(
        'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/main_services',
        options: Options(
          headers: {
            'Authorization': 'Bearer YOUR_BEARER_TOKEN_HERE',
            'apikey': 'YOUR_API_KEY_HERE',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _services = data.map((json) => Service.fromJson(json)).toList();
      } else {
        print('فشل في جلب البيانات: ${response.statusCode}');
      }
    } catch (e) {
      print('خطأ في الاتصال: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
