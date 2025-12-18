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

---

**Made with ❤️ by [rly09](https://github.com/rly09)**
