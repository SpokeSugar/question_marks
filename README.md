# Question Marks [日本語](/README_JP.md)

A Flutter-based quiz application designed for exam preparation and study.

## Overview

Question Marks is a cross-platform application built with Flutter that allows users to create, manage, and take quizzes. Whether you are studying for a certification exam or just want to test your knowledge, this app provides a simple and effective way to practice.

## Features

- **Quiz Management**: Create and organize your own questions and answers.
- **Take Quizzes**: Interactive quiz interface to test your knowledge.
- **Track Results**: View your quiz results to monitor your progress.
- **File Import**: Support for importing question data from external files (CSV/JSON).

## Tech Stack

This project uses a modern Flutter tech stack:

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router)
- **Database**: [Sqflite](https://pub.dev/packages/sqflite) (using `sqflite_common_ffi` for desktop support)
- **Code Generation**: [Freezed](https://pub.dev/packages/freezed), [JSON Serializable](https://pub.dev/packages/json_serializable)
- **UI**: Material 3 Design with `dynamic_color`

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version `^3.7.9` or higher recommended, SDK environment is `>=3.0.0 <4.0.0`)

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/yourusername/question_marks.git
    cd question_marks
    ```

2.  Install dependencies:
    ```bash
    flutter pub get
    ```

    > **Note:** This repository does not include package files. You must run `flutter pub get` in the project directory before running the app.

### Running the App

Run the following command to start the application:

```bash
flutter run
```

### Platform Specific Notes

#### Windows
To run this application on Windows, you need the `sqlite3.dll` library.
- Download `sqlite3.dll` from the [SQLite Download Page](https://www.sqlite.org/download.html).
- Place it in a directory accessible by your system path or the application.

#### Android
- **File Selector Issue**: Please note that the `file_selector` package currently has known issues on Android ([Flutter Issue #110098](https://github.com/flutter/flutter/issues/110098)), which may prevent file opening functionalities from working correctly on this platform.

#### Other Platforms (macOS, Linux, iOS)
- While the application is built with cross-platform support in mind, debugging has been primarily conducted on Desktop environments. Unexpected issues may occur on other platforms.
- For deployment instructions, refer to the official Flutter documentation:
    - [iOS](https://docs.flutter.dev/deployment/ios)
    - [macOS](https://docs.flutter.dev/deployment/macos)
    - [Linux](https://docs.flutter.dev/deployment/linux)

## License

This project is licensed under the Mozilla Public License Version 2.0. See the [LISENCE](LISENCE) file for details.
