import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

import '../models/profile_action.dart';

class ProfileController extends ChangeNotifier {
  ProfileController();

  String _name = '';
  String _phone = '';
  String _imageUrl = '';
  File? _profileImage;
  bool _isLoading = true;

  late List<ProfileMenuSection> _sections;

  final ImagePicker _picker = ImagePicker();

  String get name => _name;
  String get phone => _phone;
  String get imageUrl => _imageUrl;
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
    try {
      final dio = Dio();

      final headers = {
        'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
        'Accept': 'application/json',
      };

      final response = await dio.get(
        'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/profile',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data is List && response.data.isNotEmpty) {
        final data = response.data[0];
        _name = data['name'] ?? '';
        _phone = data['number'] ?? '';
        _imageUrl = data['image_url'] ?? '';
      } else {
        debugPrint('لم يتم العثور على بيانات المستخدم.');
      }
    } catch (e) {
      debugPrint('خطأ أثناء جلب بيانات البروفايل: $e');
    }
  }

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _profileImage = File(picked.path);
      notifyListeners();
      // TODO: رفع الصورة إلى API (عند توفر endpoint)
    }
  }

  // ---------------------------------------------------------------------------
  // منطق القائمة
  // ---------------------------------------------------------------------------
  Future<void> changePhone() async {
    debugPrint('changePhone() called');
  }

  Future<void> changePassword() async {
    debugPrint('changePassword() called');
  }

  Future<void> changeLanguage() async {
    debugPrint('changeLanguage() (logic placeholder)');
  }

  Future<void> toggleAppMode() async {
    debugPrint('toggleAppMode() called');
  }

  void contactUs() {
    debugPrint('contactUs() called');
  }

  void showTerms() {
    debugPrint('showTerms() called');
  }

  void showAbout() {
    debugPrint('showAbout() called');
  }

  Future<void> logout() async {
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
