[English](/README.md)
# Question Marks

試験勉強などのために設計された Flutter 製のクイズアプリケーションです。

## 概要

Question Marks は、ユーザーがクイズを作成、管理、実施できるクロスプラットフォームアプリケーションです。資格試験の勉強や知識の確認など、シンプルかつ効果的に学習を進めることができます。

## 機能

- **クイズ管理**: 独自の質問と回答を作成し、整理することができます。
- **クイズ実施**: インタラクティブなクイズ画面で知識をテストできます。
- **結果の追跡**: クイズの結果を確認し、学習の進捗をモニタリングできます。
- **ファイル取り込み**: 外部ファイル（CSV/JSON）からクイズデータをインポートする機能をサポートしています。

## 技術スタック

このプロジェクトでは、最新の Flutter 技術スタックを使用しています。

- **フレームワーク**: [Flutter](https://flutter.dev/)
- **状態管理**: [Riverpod](https://riverpod.dev/)
- **ルーティング**: [GoRouter](https://pub.dev/packages/go_router)
- **データベース**: [Sqflite](https://pub.dev/packages/sqflite) (デスクトップサポートには `sqflite_common_ffi` を使用)
- **コード生成**: [Freezed](https://pub.dev/packages/freezed), [JSON Serializable](https://pub.dev/packages/json_serializable)
- **UI**: Material 3 デザインと `dynamic_color`

## セットアップとビルド方法

### 前提条件

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (バージョン `^3.7.9` 以上推奨、SDK 環境は `>=3.0.0 <4.0.0`)

### インストール手順

1.  リポジトリをクローンします:
    ```bash
    git clone https://github.com/yourusername/question_marks.git
    cd question_marks
    ```

2.  依存関係をインストールします:
    ```bash
    flutter pub get
    ```

    > **注意:** このリポジトリにはパッケージファイルが含まれていません。アプリを実行する前に、必ずプロジェクトディレクトリ内で `flutter pub get` コマンドを実行してください。

### アプリの実行

以下のコマンドを実行してアプリケーションを起動します:

```bash
flutter run
```

### プラットフォーム固有の注意点

#### Windows
このアプリケーションを Windows で実行するには、`sqlite3.dll` ライブラリが必要です。
- [SQLite ダウンロードページ](https://www.sqlite.org/download.html) から `sqlite3.dll` をダウンロードしてください。
- システムパスが通っているディレクトリ、またはアプリケーションがアクセスできるディレクトリに配置してください。

#### Android
- **File Selector の問題**: 現在、Android では `file_selector` パッケージに既知の問題 ([Flutter Issue #110098](https://github.com/flutter/flutter/issues/110098)) があり、ファイルを開く機能が正しく動作しない可能性があります。

#### その他のプラットフォーム (macOS, Linux, iOS)
- このアプリケーションはクロスプラットフォーム対応を意図して構築されていますが、デバッグは主にデスクトップ環境で行われています。そのため、デスクトップ環境以外では予期せぬ不具合が発生する可能性があります。
- 各プラットフォームへのデプロイ手順については、Flutter の公式ドキュメントを参照してください:
    - [iOS](https://docs.flutter.dev/deployment/ios)
    - [macOS](https://docs.flutter.dev/deployment/macos)
    - [Linux](https://docs.flutter.dev/deployment/linux)

## ライセンス

このプロジェクトは Mozilla Public License Version 2.0 の下でライセンスされています。詳細については [LISENCE](LISENCE) ファイルを参照してください。
