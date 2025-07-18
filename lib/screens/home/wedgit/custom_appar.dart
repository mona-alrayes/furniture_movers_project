import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // معلومات المستخدم باستخدام ListTile
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,

              title: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(width: 5),
                  const Text(
                    'مرحباً، محمد حسن',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.location_on, size: 14, color: Colors.grey),

                  Text(
                    'الاسكندرية، مصر',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          // أيقونة الجرس
          Stack(
            children: [
              const Icon(Icons.notifications_none, color: Colors.black),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1FC61F),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
