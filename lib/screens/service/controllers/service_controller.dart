import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee_model.dart';

class ServiceController {
  static const String _baseUrl =
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/employees';

  static const Map<String, String> _headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
    'Accept': 'application/json',
  };

  // خذ ID كوسيط🔵 تعديل: استبدال التابع ليأ
  static Future<EmployeeModel?> fetchEmployeeById(int id) async {
    final url = Uri.parse('$_baseUrl?id=eq.$id'); // 

    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        return EmployeeModel.fromJson(jsonData[0]);
      }
    }

    return null;
  }
}
