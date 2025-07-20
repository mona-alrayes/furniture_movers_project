import 'package:flutter/material.dart';


class ProfileController extends ChangeNotifier {
  String userName = 'اسم المستخدم';
  String profileImageUrl = 'https://i.pravatar.cc/150?img=3'; // رابط صورة افتراضية
  String location = 'الرياض، السعودية';

  // يمكن إضافة دوال لتحديث البيانات لاحقًا عند الربط مع API
  void updateUserName(String newName) {
    userName = newName;
    notifyListeners();
  }

  void updateProfileImage(String newUrl) {
    profileImageUrl = newUrl;
    notifyListeners();
  }

  void updateLocation(String newLocation) {
    location = newLocation;
    notifyListeners();
  }
}