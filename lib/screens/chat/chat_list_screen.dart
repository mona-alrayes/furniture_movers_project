import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/chat_list_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_movers_project/screens/chat/messages_screen.dart';
import 'controllers/messages_controller.dart';
import 'package:flutter/services.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
          return ChangeNotifierProvider<ChatListController>(
              create: (context) => ChatListController(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.regularGrey, width: 1),
              ),
            ),

            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'الشات',
                style: GoogleFonts.almarai(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),

        backgroundColor: AppColors.white,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Consumer<ChatListController>(
            builder: (context, controller, child) {
              return controller.chatUsers.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    padding: EdgeInsets.only(top: 16.h),
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
                                      builder: (context) => MessagesScreen(user: user),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.h),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      border: unreadMessagesCount == 0
                                          ? Border(
                                              bottom: BorderSide(
                                                color: AppColors.mediumGrey,
                                                width: 1.w,
                                              ),
                                            )
                                          : null,
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: unreadMessagesCount > 0
                                          ? AppColors.lightPrimaryGrey
                                          : AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 28.r,
                                          backgroundImage:
                                          NetworkImage(user.avatarUrl),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                user.name,
                                                style: AppFonts.fontName,
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                user.lastMessage,
                                                style:
                                                    AppFonts.lastMessagesChatFont,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        if (unreadMessagesCount > 0)
                                          Container(
                                            padding: EdgeInsets.all(10.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(
                                              unreadMessagesCount.toString(),
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white,
                                              ),
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