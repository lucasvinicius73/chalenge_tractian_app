# Challenge Tractian Mobile
Challenge proposed by Tractian for the position of Mobile Software Engineer. The challenge consists of creating a Flutter application for application for monitoring and visualizing a company's assets and locations. It organizes hierarchical data in an expandable tree interface and offers search and filter functionalities for different asset statuses.

[Challenge Link](https://github.com/tractian/challenges/blob/main/mobile/README.md)


## Technology Stack:
- **Framework**: Flutter
- **Language**: Dart
- **Status Management**: ChangeNotifier and GetIt (Dependency injection)
- **API**: HTTP

## Stack Version:
**Requirements**:
- Dart SDK 2.18+
- Flutter SDK 3.3+

## Libraries used:
- [http: ^1.2.2](https://pub.dev/packages/http) 
- [string_similarity: ^2.1.1](https://pub.dev/packages/string_similarity)
- [super_sliver_list: ^0.4.1](https://pub.dev/packages/super_sliver_list)

## API consumed:
- API: [fake-api.tractian.com](fake-api.tractian.com)

## Architecture Overview:
**Folder Structure:**
  <pre>├── <b>lib</b>
│   ├── <b>app</b>
│   │   ├── <b>asset/</b>
│   │   └── <b>home/</b>
│   ├── app_widget.dart
│   ├── main.dart
│   ├── providers.dart
│   └── <b>shared</b>
│       ├── <b>models/</b>
│       ├── <b>repository/</b>
│       ├── <b>service/</b>
│       ├── states.dart
│       └── <b>utils</b>
│           ├── <b>themes/</b>
│           └── <b>widgets/</b></pre>

- **app/asset**: 
- **app/home**: