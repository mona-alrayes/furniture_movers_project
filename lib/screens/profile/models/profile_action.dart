import 'package:flutter/foundation.dart';

/// الأفعال المحتملة لعناصر قائمة البروفايل.
enum ProfileAction {
  changePhone,
  changePassword,
  changeLanguage,
  toggleAppMode,
  contactUs,
  showTerms,
  showAbout,
  logout,
}

/// عنصر مفرد في قائمة البروفايل.
class ProfileMenuItem {
  final String iconPath;
  final String label; // النص المعروض للمستخدم
  final ProfileAction action; // نوع الإجراء (لا منطق هنا)

  const ProfileMenuItem({
    required this.iconPath,
    required this.label,
    required this.action,
  });
}

/// مجموعة (قسم) من عناصر القائمة.
class ProfileMenuSection {
  final String title;
  final List<ProfileMenuItem> items;

  const ProfileMenuSection({required this.title, required this.items});
}