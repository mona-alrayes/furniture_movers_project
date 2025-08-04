import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/screens/profile/profile_screen.dart';

class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBarHome({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: Row(
          children: [

            InkWell(onTap: (){
              Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => ProfileScreen(),
  ),
);
            },

              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            SizedBox(width: 8.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحباً، محمد حسن',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14.r, color: Colors.grey),
                      SizedBox(width: 2.w),
                      Text(
                        'الاسكندرية، مصر',
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 18.r,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Stack(
              children: [
                Icon(Icons.notifications_none, color: Colors.black, size: 24.r),
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1FC61F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
