import 'dart:convert';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';
import 'package:http/http.dart' as http;

Future<List<WorkerModel>> fetchWorkers(String categoryId) async {
  final response = await http.get(
    Uri.parse(
      "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/employees?category_id=eq.$categoryId",
    ),
    headers: {
      'apikey': 'YOUR_SUPABASE_ANON_KEY',
      'Authorization': 'Bearer YOUR_SUPABASE_ANON_KEY',
      'Content-Type': 'application/json',
      'Prefer': 'return=representation', // لو تحب
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => WorkerModel.fromJson(json)).toList();
  } else {
    throw Exception('فشل في تحميل البيانات: ${response.statusCode}');
  }
}
