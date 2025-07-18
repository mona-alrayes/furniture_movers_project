import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class ProfileMenuItem {
  final String iconPath;
  final String label;
  final VoidCallback? onTap;

  ProfileMenuItem({
    required this.iconPath,
    required this.label,
    this.onTap,
  });
}

class ProfileMenuSection {
  final String title;
  final List<ProfileMenuItem> items;

  ProfileMenuSection({required this.title, required this.items});
}

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

  Future<void> changePhone() async {
    // TODO: أضف المنطق لتغيير رقم الهاتف
  }

  Future<void> changePassword() async {
    // TODO
  }

  Future<void> changeLanguage() async {
    // TODO
  }

  Future<void> toggleAppMode() async {
    // TODO
  }

  void contactUs() {
    // TODO
  }

  void showTerms() {
    // TODO
  }

  void showAbout() {
    // TODO
  }

  Future<void> logout() async {
    // TODO
  }

  void _buildSections() {
    _sections = [
      ProfileMenuSection(
        title: 'الحساب',
        items: [
          ProfileMenuItem(
            iconPath: 'assets/icons/contact-icon.png',
            label: 'تغيير رقم التلفون',
            onTap: changePhone,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/lock-open.png',
            label: 'تغيير كلمة المرور',
            onTap: changePassword,
          ),
        ],
      ),
      ProfileMenuSection(
        title: 'التفضيلات',
        items: [
          ProfileMenuItem(
            iconPath: 'assets/icons/world-longitude.png',
            label: 'لغة التطبيق',
            onTap: changeLanguage,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/Sun.png',
            label: 'مود التطبيق',
            onTap: toggleAppMode,
          ),
        ],
      ),
      ProfileMenuSection(
        title: 'السياسات والخصوصية',
        items: [
          ProfileMenuItem(
            iconPath: 'assets/icons/contact-icon.png',
            label: 'تواصل بنا',
            onTap: contactUs,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/Paper1.png',
            label: 'شروط الخدمة',
            onTap: showTerms,
          ),
          ProfileMenuItem(
            iconPath: 'assets/icons/about-icon.png',
            label: 'حول التطبيق',
            onTap: showAbout,
          ),
        ],
      ),
    ];
  }
}
