import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:furniture_movers_project/screens/chat/models/chat_user.dart';

class MessagesController extends ChangeNotifier {
  late ChatUser otherUser;

  final List<Message> _messages = [];
  int _unreadMessagesCount = 0;

  List<Message> get messages => _messages;
  int get unreadMessagesCount => _unreadMessagesCount;

  MessagesController(ChatUser user) {
    this.otherUser = user;
    _loadMockData();
  }

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

  void _loadMockData() {
    _messages.addAll([
      Message(
        id: 'm1',
        senderId: '2',
        text: 'I tell you a joke.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        id: 'm2',
        senderId: '2',
        text: 'Do you know what do you call a body without nose?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      Message(
        id: 'm3',
        senderId: '1',
        text: 'What?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        isRead: true,
      ),
      Message(
        id: 'm4',
        senderId: '1',
        text: 'No idea.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        isRead: true,
      ),
      Message(
        id: 'm5',
        senderId: '1',
        text: 'Lorem ipsum dolor sit amet consectetur. Vivamus massa aenean varius etiam imperdiet placerat arcu.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        isRead: false,
      ),
      Message(
        id: 'm6',
        senderId: '2',
        text: 'Nobody knows.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ]);
    _updateUnreadCount();
    notifyListeners();
  }

  void sendMessage(String text) {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: '1',
      text: text,
      timestamp: DateTime.now(),
      isRead: false,
    );
    _messages.add(newMessage);

    if (newMessage.senderId != '1') {
      _unreadMessagesCount++;
    }

    notifyListeners();
  }

  void _updateUnreadCount() {
    _unreadMessagesCount = _messages.where((message) => !message.isRead && message.senderId != '1').length;
  }

  void markAsRead(String messageId) {
    final message = _messages.firstWhere((msg) => msg.id == messageId);
    if (!message.isRead) {
      message.isRead = true;
      _unreadMessagesCount--;
      notifyListeners();
    }
  }

  Map<String, List<Message>> get groupedMessages {
    Map<String, List<Message>> grouped = {};

    for (var message in _messages) {
      final dateKey = DateTime(message.timestamp.year, message.timestamp.month, message.timestamp.day)
          .toIso8601String();
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(message);
    }

    var sortedKeys = grouped.keys.toList()
      ..sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

    Map<String, List<Message>> sortedGrouped = {};
    for (var key in sortedKeys) {
      sortedGrouped[key] = grouped[key]!;
    }

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
  final String senderId;
  final String text;
  final DateTime timestamp;
  bool isRead;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    this.isRead = false,
  });
}
