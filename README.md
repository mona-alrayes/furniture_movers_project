# Furniture Movers App

A comprehensive Flutter mobile application that connects customers with professional furniture moving services. This app provides a seamless platform for booking furniture moving services, managing appointments, and communicating with service providers.

## 🚀 Features

### Core Functionality
- **User Authentication**: Secure login and registration system with OTP verification
- **Service Booking**: Browse and book furniture moving services
- **Worker Management**: View available workers with ratings and reviews
- **Real-time Chat**: Direct communication with service providers
- **Favorites System**: Save preferred workers and services
- **Profile Management**: User profile customization and settings

### User Experience
- **Multi-language Support**: Arabic and English interface
- **Responsive Design**: Optimized for various screen sizes
- **Modern UI/UX**: Clean, intuitive interface with Material Design
- **Offline Capabilities**: Core functionality available offline

### Technical Features
- **State Management**: Provider pattern for efficient state management
- **API Integration**: RESTful API communication with backend services
- **Image Handling**: Profile pictures and service images
- **Push Notifications**: Real-time updates and alerts

## 📱 Screenshots

*[Screenshots will be added here]*

## 🛠️ Technology Stack

- **Framework**: Flutter 3.7.0+
- **Language**: Dart
- **State Management**: Provider
- **HTTP Client**: Dio & HTTP
- **UI Components**: Material Design & Custom Widgets
- **Image Handling**: Image Picker & Flutter SVG
- **Responsive Design**: Flutter ScreenUtil
- **Fonts**: Google Fonts, Custom Arabic Fonts (Almarai, Tajawal, Poppins)

## 📋 Prerequisites

Before running this project, make sure you have the following installed:

- **Flutter SDK**: 3.7.0 or higher
- **Dart SDK**: 3.0.0 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Android SDK** (for Android development)
- **Xcode** (for iOS development, macOS only)

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/furniture_movers_project.git
   cd furniture_movers_project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Configuration

1. **API Configuration**
   - Update API endpoints in the service files
   - Configure base URL for your backend services

2. **Environment Setup**
   - Set up your development environment
   - Configure signing for release builds

## 📁 Project Structure

```
lib/
├── core/
│   ├── theme/
│   ├── widgets/
│   └── utils/
├── screens/
│   ├── auth/
│   ├── home/
│   ├── furniture_moving/
│   ├── service/
│   ├── chat/
│   ├── profile/
│   ├── favorite/
│   └── splash/
└── main.dart
```

## 🔧 Dependencies

### Core Dependencies
- `flutter`: The Flutter framework
- `provider`: State management
- `dio`: HTTP client for API calls
- `http`: Additional HTTP functionality

### UI Dependencies
- `flutter_screenutil`: Responsive design
- `google_fonts`: Typography
- `flutter_svg`: SVG image support
- `carousel_slider`: Image carousels
- `smooth_page_indicator`: Page indicators

### Authentication & Input
- `intl_phone_field`: Phone number input
- `otp_text_field`: OTP input fields
- `pin_code_fields`: PIN code input

### Utilities
- `url_launcher`: External link handling
- `image_picker`: Image selection
- `intl`: Internationalization
- `font_awesome_flutter`: Icons

## 🎨 Design System

### Colors
- Primary: Black (#000000)
- Secondary: Custom color palette
- Background: White (#FFFFFF)

### Typography
- **Almarai**: Arabic text (Regular, Bold, ExtraBold)
- **Tajawal**: Arabic headings (ExtraBold)
- **Poppins**: English text (Regular, SemiBold, Bold)

### Layout
- Design Size: 428x926 (iPhone 12 Pro Max)
- Responsive scaling for different screen sizes
- RTL support for Arabic language

## 📱 Supported Platforms

- **Android**: API level 21 and above
- **iOS**: iOS 11.0 and above
- **Web**: Chrome, Firefox, Safari, Edge
- **Desktop**: Windows, macOS, Linux

## 🔒 Security Features

- Secure authentication with OTP verification
- Password reset functionality
- Input validation and sanitization
- Secure API communication

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support and questions:
- Email: moon.2060@gmail.com
- Issues: [GitHub Issues](https://github.com/yourusername/furniture_movers_project/issues)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Contributors and maintainers
- Design inspiration and UI components

---

**Made with ❤️ using Flutter**
