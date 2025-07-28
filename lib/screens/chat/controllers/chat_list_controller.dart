import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/chat_user.dart';

class ChatListController extends ChangeNotifier {
  List<ChatUser> _chatUsers = [];
  List<ChatUser> get chatUsers => _chatUsers;

  final String _url = 'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/chats';
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';
  final String _bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';

  ChatListController() {
    loadChats();
  }

  Future<void> loadChats() async {
    try {
      final response = await http.get(
        Uri.parse(_url),
        headers: {
          'apikey': _apiKey,
          'Authorization': 'Bearer $_bearerToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _chatUsers = data.map((e) => ChatUser.fromJson(e)).toList();
        notifyListeners();
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
