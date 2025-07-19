import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../models/profile_action.dart';

class ProfileController extends ChangeNotifier {
  ProfileController();

  String _name = '';
  String _phone = '';
  File? _profileImage;
  bool _isLoading = true;

  late List<ProfileMenuSection> _sections;

  final ImagePicker _picker = ImagePicker();

  String get name => _name;
  String get phone => _phone;
  File? get profileImage => _profileImage;
  bool get isLoading => _isLoading;
  List<ProfileMenuSection> get sections => _sections;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchProfileData();
    _buildSections();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchProfileData() async {
    await Future.delayed(const Duration(seconds: 1));
    _name = 'محمد علي';
    _phone = '009677356464774';
  }

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _profileImage = File(picked.path);
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // TODO منطق العناصر (تُستدعى من واجهة المستخدم حسب ProfileAction)
  // ---------------------------------------------------------------------------
  Future<void> changePhone() async {
    // TODO: أضف المنطق لتغيير رقم الهاتف
    debugPrint('changePhone() called');
  }

  Future<void> changePassword() async {
    // TODO
    debugPrint('changePassword() called');
  }

  Future<void> changeLanguage() async {
    // ملاحظة: الملاحة تُدار من شاشة البروفايل. اتركها فارغة أو استخدم event bus.
    debugPrint('changeLanguage() (logic placeholder)');
  }

  Future<void> toggleAppMode() async {
    // TODO: Light / Dark
    debugPrint('toggleAppMode() called');
  }

  void contactUs() {
    // TODO: افتح mailto أو صفحة تواصل
    debugPrint('contactUs() called');
  }

  void showTerms() {
    // TODO: اعرض صفحة شروط الخدمة
    debugPrint('showTerms() called');
  }

  void showAbout() {
    // TODO: اعرض صفحة حول التطبيق
    debugPrint('showAbout() called');
  }

  Future<void> logout() async {
    // TODO: سجل خروج المستخدم
    debugPrint('logout() called');
  }

  void _buildSections() {
    _sections = [
      ProfileMenuSection(
        title: 'الحساب',
        items: const [
          ProfileMenuItem(
            iconPath: 'assets/icons/contact-icon.png',
            label: 'تغيير رقم التلفون',
            action: ProfileAction.changePhone,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/lock-open.png',
            label: 'تغيير كلمة المرور',
            action: ProfileAction.changePassword,
          ),
        ],
      ),
      ProfileMenuSection(
        title: 'التفضيلات',
        items: const [
          ProfileMenuItem(
            iconPath: 'assets/icons/world-longitude.png',
            label: 'لغة التطبيق',
            action: ProfileAction.changeLanguage,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/Sun.png',
            label: 'مود التطبيق',
            action: ProfileAction.toggleAppMode,
          ),
        ],
      ),
      ProfileMenuSection(
        title: 'السياسات والخصوصية',
        items: const [
          ProfileMenuItem(
            iconPath: 'assets/icons/contact-icon.png',
            label: 'تواصل بنا',
            action: ProfileAction.contactUs,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/Paper1.png',
            label: 'شروط الخدمة',
            action: ProfileAction.showTerms,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/about-icon.png',
            label: 'حول التطبيق',
            action: ProfileAction.showAbout,
          ),
        ],
      ),
    ];
  }
}