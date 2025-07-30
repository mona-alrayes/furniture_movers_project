import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:furniture_movers_project/screens/chat/models/chat_user.dart';

class MessagesController extends ChangeNotifier {
  late ChatUser otherUser;
  late String chatId;

  final List<Message> _messages = [];
  int _unreadMessagesCount = 0;

  final String baseUrl = "https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1";
  final String _apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';
  final String _bearerToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw';

  List<Message> get messages => _messages;
  int get unreadMessagesCount => _unreadMessagesCount;

  MessagesController(ChatUser user) {
    this.otherUser = user;
    this.chatId = user.id;
    loadMessages();
  }

  String get messagesUrl => "$baseUrl/messages?chat_id=eq.$chatId";

  Message get lastMessage {
    return _messages.isNotEmpty
        ? _messages.last
        : Message(
      id: 'no_messages',
      senderId: '',
      text: 'لا توجد رسائل بعد',
      timestamp: DateTime.now(),
    );
  }

  void markMessagesAsRead() {
    bool isUpdated = false;
    for (var message in _messages) {
      if (!message.isRead) {
        message.isRead = true;
        isUpdated = true;
      }
    }
    if (isUpdated) {
      _unreadMessagesCount = 0;
      notifyListeners();
    }
  }

  Future<void> loadMessages() async {
    try {
      final response = await http.get(
        Uri.parse(messagesUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_bearerToken',
          'apikey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");
        final List<dynamic> data = json.decode(response.body);
        _messages.clear();

        for (var item in data) {
          final message = Message.fromJson(item);
          _messages.add(message);
        }

        _updateUnreadCount();
        notifyListeners();
        print('Loaded ${_messages.length} messages from API');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        throw Exception('فشل في تحميل الرسائل');
      }
    } catch (e) {
      print('خطأ في تحميل الرسائل $e');
    }
  }

  Future<void> sendMessage(String text) async {
    print('Sending message: $text');

    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: '1',
      text: text,
      timestamp: DateTime.now(),
      isRead: false,
      chatId: chatId,
    );

    print('Created message with ID: ${newMessage.id}, timestamp: ${newMessage.timestamp}');

    _messages.add(newMessage);
    _unreadMessagesCount++;
    print('Message added to UI immediately. Total messages: ${_messages.length}');
    notifyListeners();
    print('Message shown in UI instantly');

    try {
      final requestBody = {
        'chat_id': chatId,
        'text': newMessage.text,
        'timestamp': newMessage.timestamp.toIso8601String(),
      };

      print('Sending to API in background: ${json.encode(requestBody)}');

      final response = await http.post(
        Uri.parse("$baseUrl/messages"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $_bearerToken',
          'apikey': _apiKey,
          'Content-Type': 'application/json',
          'Prefer': 'return=minimal',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Message saved to database successfully');
      } else {
        print('Warning: Failed to save message to database: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Warning: API call failed, but message is still shown in UI: $e');
    }
  }

  void _updateUnreadCount() {
    _unreadMessagesCount = _messages.where((message) => !message.isRead && message.senderId == 'other').length;
    print('Updated unread count: $_unreadMessagesCount (messages from other user)');
  }

  Future<void> markAsRead(String messageId) async {
    final message = _messages.firstWhere((msg) => msg.id == messageId);
    if (!message.isRead) {
      message.isRead = true;
      _unreadMessagesCount--;
      notifyListeners();
    }
  }

  Map<String, List<Message>> get groupedMessages {
    Map<String, List<Message>> grouped = {};

    print('Grouping ${_messages.length} messages');

    for (var message in _messages) {
      final dateKey = DateTime(message.timestamp.year, message.timestamp.month, message.timestamp.day)
          .toIso8601String();
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(message);
      print('Added message: ${message.text} to date: $dateKey');
    }

    var sortedKeys = grouped.keys.toList()
      ..sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

    Map<String, List<Message>> sortedGrouped = {};
    for (var key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }

    print('Grouped messages into ${sortedGrouped.length} date groups');
    return sortedGrouped;
  }

  String getDateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final diff = today.difference(date).inDays;

    if (diff == 0) {
      return 'اليوم';
    } else if (diff == 1) {
      return 'أمس';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}

class Message {
  final String id;
  String senderId;
  final String text;
  final DateTime timestamp;
  bool isRead;
  final String? chatId;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isRead = false,
    this.chatId,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    String senderId;
    if (json['is_me'] == true) {
      senderId = '1';
    } else {
      senderId = 'other';
    }

    return Message(
      id: json['id']?.toString() ?? '',
      senderId: senderId,
      text: json['text'] ?? '',
      timestamp: DateTime.parse(json['created_at'] ?? json['timestamp'] ?? DateTime.now().toIso8601String()),
      isRead: json['is_read'] ?? json['isRead'] ?? false,
      chatId: json['chat_id']?.toString() ?? json['chatId']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
      'chat_id': chatId,
    };
  }
}
