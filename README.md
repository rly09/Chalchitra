# Chalchitra 🎬

> A cross-platform Flutter movie discovery application with a modern, responsive UI and seamless user experience.

## Overview

Chalchitra is a Flutter-based movie browsing and discovery app designed for **Android**, **iOS**, **Web**, **Windows**, **macOS**, and **Linux**. Built with a single codebase, it demonstrates best practices in cross-platform development, clean architecture, and modular design patterns.

## ✨ Features

- 📱 **Cross-Platform Support** – Single Flutter codebase targeting mobile, desktop, and web
- 🎨 **Modern UI** – Clean, intuitive interface with smooth animations and responsive layouts
- 🔍 **Movie Discovery** – Browse, search, and explore movies with ease
- ⚡ **High Performance** – Optimized rendering and efficient state management
- 📦 **Modular Architecture** – Clean code structure for easy maintenance and scalability
- 🌐 **Web-Ready** – Fully functional web experience alongside native apps

## 🛠️ Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** Provider / Bloc / Riverpod (configurable)
- **Backend:** RESTful API integration ready
- **Database:** SQLite / Hive for local caching
- **Platform Support:** Android (Kotlin/Java), iOS (Swift), Web (Dart/HTML), Desktop (C++)
- **Build Tools:** Gradle (Android), Xcode (iOS), CMake (Desktop)

## 📋 Prerequisites

- Flutter SDK (v3.0 or higher) – [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Git
- Platform-specific requirements:
  - **Android:** Android Studio + SDK
  - **iOS:** Xcode + CocoaPods
  - **Web:** Chrome, Firefox, or Safari
  - **Desktop:** Visual Studio (Windows) or build tools for your OS

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/rly09/Chalchitra.git
cd Chalchitra
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Web:**
```bash
flutter run -d chrome
```

**Windows/macOS/Linux:**
```bash
flutter run -d windows  # or macos, linux
```

### 4. Build Release Versions

```bash
flutter build apk          # Android APK
flutter build ios          # iOS IPA
flutter build web          # Web bundle
flutter build windows      # Windows executable
flutter build macos        # macOS app bundle
flutter build linux        # Linux executable
```

## 📁 Project Structure

```
Chalchitra/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/                   # Data models
│   ├── screens/                  # UI screens
│   ├── widgets/                  # Reusable widgets
│   ├── services/                 # API & local storage services
│   ├── providers/                # State management
│   └── utils/                    # Utility functions & constants
├── assets/
│   ├── images/                   # Image assets
│   ├── icons/                    # App icons
│   └── fonts/                    # Custom fonts
├── android/                      # Android native code
├── ios/                          # iOS native code
├── web/                          # Web platform code
├── windows/                      # Windows native code
├── macos/                        # macOS native code
├── linux/                        # Linux native code
├── pubspec.yaml                  # Flutter dependencies
└── README.md                     # This file
```

## 🎯 Roadmap

- [ ] Integrate TMDB API for live movie data
- [ ] User authentication & profiles
- [ ] Watchlist & bookmarking functionality
- [ ] Advanced search & filtering
- [ ] Movie recommendations based on preferences
- [ ] Rating & review system
- [ ] Dark mode support
- [ ] Offline mode with cached content
- [ ] Push notifications for new releases
- [ ] Social sharing features

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow [Dart conventions](https://dart.dev/guides/language/effective-dart)
- Format code with `flutter format .`
- Analyze with `flutter analyze`

## 📝 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

## 🙋 Support & Contact

Have questions or suggestions? Open an [issue](https://github.com/rly09/Chalchitra/issues) or reach out directly.

---

**Made with ❤️ by [rly09](https://github.com/rly09)**
