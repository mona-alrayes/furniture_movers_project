import 'package:flutter/material.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/theme/fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/chat/models/chat_user.dart';
import 'package:furniture_movers_project/screens/chat/controllers/messages_controller.dart';

enum MessagePosition {
  single,
  first,
  middle,
  last,
}

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.user});
  final ChatUser user;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late final MessagesController controller;
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = MessagesController(widget.user);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }
    });

    controller.loadMessages();
  }


  @override
  void dispose() {
    textController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groupedMessages = controller.groupedMessages;
    final sortedDates = groupedMessages.keys.toList()
      ..sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));

    MessagePosition getMessagePosition(List messages, int index) {
      final current = messages[index];
      final isFirst = index == 0 || messages[index - 1].senderId != current.senderId;
      final isLast = index == messages.length - 1 || messages[index + 1].senderId != current.senderId;

      if (isFirst && isLast) return MessagePosition.single;
      if (isFirst) return MessagePosition.first;
      if (isLast) return MessagePosition.last;
      return MessagePosition.middle;
    }

    BorderRadius getMessageBorderRadius(bool isMe, MessagePosition position) {
      const radius = Radius.circular(18);
      const sharp = Radius.circular(0);

      if (isMe) {
        switch (position) {
          case MessagePosition.first:
            return const BorderRadius.only(
              topLeft: radius,
              topRight: radius,
              bottomLeft: radius,
              bottomRight: sharp,
            );
          case MessagePosition.middle:
            return const BorderRadius.only(
              topLeft: radius,
              topRight: sharp,
              bottomLeft: radius,
              bottomRight: sharp,
            );
          case MessagePosition.last:
            return const BorderRadius.only(
              topLeft: radius,
              topRight: sharp,
              bottomLeft: radius,
              bottomRight: radius,
            );
          case MessagePosition.single:
            return BorderRadius.circular(18);
        }
      } else {
        switch (position) {
          case MessagePosition.first:
            return const BorderRadius.only(
              topLeft: radius,
              topRight: radius,
              bottomLeft: sharp,
              bottomRight: radius,
            );
          case MessagePosition.middle:
            return const BorderRadius.only(
              topLeft: sharp,
              topRight: radius,
              bottomLeft: sharp,
              bottomRight: radius,
            );
          case MessagePosition.last:
            return const BorderRadius.only(
              topLeft: sharp,
              topRight: radius,
              bottomLeft: radius,
              bottomRight: radius,
            );
          case MessagePosition.single:
            return BorderRadius.circular(18);
        }
      }
    }

    List<List<Message>> groupMessagesBySender(List<Message> messages) {
      if (messages.isEmpty) return [];

      List<List<Message>> grouped = [];
      List<Message> currentGroup = [messages.first];

      for (int i = 1; i < messages.length; i++) {
        if (messages[i].senderId == messages[i - 1].senderId) {
          currentGroup.add(messages[i]);
        } else {
          grouped.add(currentGroup);
          currentGroup = [messages[i]];
        }
      }
      grouped.add(currentGroup);
      return grouped;
    }

    void sendMessage() {
      if (textController.text.trim().isNotEmpty) {
        controller.sendMessage(textController.text.trim());
        textController.clear();
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 72.h,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.regularGrey, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: AppColors.grey, size: 20.sp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.user.name, style: AppFonts.mainNameChatMessagesFont),
                      SizedBox(height: 10.h),
                      Text(
                        widget.user.isOnline ? 'online' : 'offline',
                        style: widget.user.isOnline ?  AppFonts.onlinStatueChatMessagesFont : AppFonts.offlinStatueChatMessagesFont
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.avatarUrl),
                    radius: 24.r,
                  ),
                ],
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.h),
          child: Container(
            height: 2.h,
            color: AppColors.mediumGrey,
          ),
        ),
      ),
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                reverse: false,
                itemCount: sortedDates.length,
                itemBuilder: (context, index) {
                  final dateKey = sortedDates[index];
                  final messagesForDate = List.of(groupedMessages[dateKey]!);
                  messagesForDate.sort((a, b) => a.timestamp.compareTo(b.timestamp));

                  final date = DateTime.parse(dateKey);
                  final dateLabel = controller.getDateLabel(date);

                  final groupedBySender = groupMessagesBySender(messagesForDate);

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        IntrinsicWidth(
                          child: Container(
                            height: 30.h,
                            margin: EdgeInsets.symmetric(vertical: 12.h),
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.veryLightGrey,
                            ),
                            child: Text(
                              dateLabel,
                              style: AppFonts.daySentMessagesFont,
                            ),
                          ),
                        ),
                        ...groupedBySender.map((group) {
                          final isMe = group.first.senderId == '1';

                          return Align(
                            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (!isMe)
                                    Padding(
                                      padding: EdgeInsets.only(left: 12.w),
                                      child: Transform.translate(
                                        offset: Offset(0, 4.h),
                                        child: CircleAvatar(
                                          radius: 26.r,
                                          backgroundImage: NetworkImage(widget.user.avatarUrl),
                                        ),
                                      ),
                                    )
                                  else
                                    SizedBox(width: 48.w),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: isMe
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: List.generate(group.length, (index) {
                                        final message = group[index];
                                        final position = getMessagePosition(group, index);

                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: index == 0 ? 0 : 4.h,
                                            left: isMe ? 48.w : 8.w,
                                            right: isMe ? 16.w : 48.w,
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                          decoration: BoxDecoration(
                                            color: isMe ? AppColors.primary : AppColors.darkBlue,
                                            borderRadius: getMessageBorderRadius(isMe, position),
                                          ),
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  message.text,
                                                  style: AppFonts.userMessagesFont,
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              if (isMe) ...[
                                                Text(
                                                  _formatTime(message.timestamp),
                                                  style: AppFonts.formatTimeMessagesFont,
                                                ),
                                                SizedBox(width: 4.w),
                                                SvgPicture.asset(
                                                  message.isRead
                                                      ? 'assets/icons/check_icon.svg'
                                                      : 'assets/icons/checked_icon.svg',
                                                  width: message.isRead ? 24.w : 12.w,
                                                  height: message.isRead ? 24.h : 12.h,
                                                  color: message.isRead ? AppColors.brightBlue : AppColors.grey,
                                                  fit: BoxFit.contain,
                                                ),
                                              ] else ...[
                                                Text(
                                                  _formatTime(message.timestamp),
                                                  style: AppFonts.formatTimeMessagesFont,
                                                ),
                                              ],
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 48.h),
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Image.asset(
                          'assets/icons/send_icon.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: sendMessage,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.lightPrimaryGrey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textController,
                              textAlign: TextAlign.right,
                              onSubmitted: (_) => sendMessage(),
                              decoration: InputDecoration(
                                hintText: 'اكتب',
                                hintStyle: AppFonts.hintTextBoxFont,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_sharp, color: AppColors.primary, size: 30.sp),
                            onPressed: () async {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final suffix = time.hour >= 12 ? 'pm' : 'am';
    return '$hour:$minute $suffix';
  }
}
