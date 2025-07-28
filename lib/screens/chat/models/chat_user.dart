// class ChatUser {
//   final String id;
//   final String name;
//   final String avatarUrl;
//   final String status;
//
//   ChatUser({
//     required this.id,
//     required this.name,
//     required this.avatarUrl,
//     required this.status,
//   });
// }
class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final bool isOnline;
  final String status;

  ChatUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.isOnline,
    required this.status,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      avatarUrl: json['image_url'] ?? '',
      lastMessage: json['last_message'] ?? '',
      isOnline: json['is_online'] ?? false,
      status: json['status'] ?? '',
    );
  }
}
