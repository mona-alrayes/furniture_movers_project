import 'package:flutter/material.dart';
import 'package:furniture_movers_project/screens/chat/models/chat_user.dart';

class ChatListController extends ChangeNotifier {
  List<ChatUser> _chatUsers = [];

  List<ChatUser> get chatUsers => _chatUsers;

  ChatListController() {
    loadChats();
  }

  void loadChats() async {
    await Future.delayed(const Duration(seconds: 1));

    _chatUsers = [
      ChatUser(id: '1', name: "علي الشمري", avatarUrl: "assets/images/avatar.jpg", status: "متصل"),
      ChatUser(id: '2', name: "فاطمة الزهراء", avatarUrl: "assets/images/avatar.jpg", status: "غائب"),
      ChatUser(id: '3', name: "سعيد البلوشي", avatarUrl: "assets/images/avatar.jpg", status: "متصل"),
      ChatUser(id: '4', name: "ليلى العلي", avatarUrl: "assets/images/avatar.jpg", status: "غائب"),
      ChatUser(id: '5', name: "حسن الجبوري", avatarUrl: "assets/images/avatar.jpg", status: "متصل"),
    ];

    notifyListeners();
  }
}
