import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginInController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String _apiUrl = 'https://ftcbwmmsnykncncsyrfs.supabase.co/auth/v1/signup'; // TEMP: for testing
  final Map<String, String> _headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Content-Type': 'application/json',
  };

  Future<Map<String, dynamic>> LoginIn() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: _headers,
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || data['access_token'] != null) {
        print('login successful');
        return {
          'success': true,
          'message': 'تم تسجيل الدخول بنجاح',
        };
      } else {
        return {
          'success': false,
          'message': data['msg'] ?? data['error_description'] ?? 'فشل تسجيل الدخول. تحقق من البيانات.',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'حدث خطأ غير متوقع. حاول مرة أخرى.',
      };
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
