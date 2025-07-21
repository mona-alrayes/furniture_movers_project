import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/chat_list_controller.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/chat/messages_screen.dart';
import 'controllers/messages_controller.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatListController>(
      create: (context) => ChatListController(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'الشات',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.white,
          toolbarHeight: 72,
          elevation: 1,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(height: 2, color: AppColors.mediumGrey),
          ),
        ),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Consumer<ChatListController>(
            builder: (context, controller, child) {
              return controller.chatUsers.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: controller.chatUsers.length,
                    itemBuilder: (context, index) {
                      final user = controller.chatUsers[index];

                      return ChangeNotifierProvider<MessagesController>(
                        create: (context) => MessagesController(user),
                        child: Consumer<MessagesController>(
                          builder: (context, messagesController, child) {
                            final lastMessage = messagesController.lastMessage;
                            final unreadMessagesCount =
                                messagesController.unreadMessagesCount;

                            return GestureDetector(
                              onTap: () {
                                messagesController.markMessagesAsRead();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MessagesScreen(user: user),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border:
                                        unreadMessagesCount == 0
                                            ? Border(
                                              bottom: BorderSide(
                                                color: AppColors.mediumGrey,
                                                width: 1,
                                              ),
                                            )
                                            : null,
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        unreadMessagesCount > 0
                                            ? AppColors.lightPrimaryGrey
                                            : AppColors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (unreadMessagesCount > 0)
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Text(
                                            unreadMessagesCount.toString(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              user.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              lastMessage.text,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: AssetImage(
                                          user.avatarUrl,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
            },
          ),
        ),
      ),
    );
  }
}
