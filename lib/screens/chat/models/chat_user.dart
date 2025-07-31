class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.isOnline,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? json['title'] ?? json['user_name'] ?? '',
      avatarUrl: json['image_url'] ?? json['avatar_url'] ?? json['profile_image'] ?? '',
      lastMessage: json['last_message'] ?? json['message'] ?? '',
      isOnline: json['is_online'] ?? json['online'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': avatarUrl,
      'last_message': lastMessage,
      'is_online': isOnline,
    };
  }
}
