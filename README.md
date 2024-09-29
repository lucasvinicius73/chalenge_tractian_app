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
- [get_it: ^7.7.0](https://pub.dev/packages/get_it)
- [equatable: ^2.0.5](https://pub.dev/packages/equatable)
- [result_dart: ^1.1.1](https://pub.dev/packages/result_dart)
- [mocktail: ^1.0.4](https://pub.dev/packages/mocktail)

## API consumed:
- API: [fake-api.tractian.com](fake-api.tractian.com)

## Architecture Overview:

#### Design Patterns:
The design patterns chosen to build this app were:
- **MVC:** Structuring the project with the Model, View and Controllers entities. Used to separate the logical functions from the UI
- **Repository:** Used to separate the app's communication function with the external API layer
- **Service:** It was used to organize the application's business logic, encapsulating specific and complex operations that shouldn't be directly in the models or controllers 

#### Folder Structure:
<pre>
├──<b>lib/</b>
│   ├──<b>app/</b>
│   │   ├──<b>asset/</b>
│   │   └──<b>home/</b>
│   ├── app_widget.dart
│   ├── main.dart
│   ├── providers.dart
│   └──<b>shared/</b>
│       ├──<b>models/</b>
│       ├──<b>repository/</b>
│       ├──<b>service/</b>
│       ├──<b>states/</b>
│       └──<b>utils/</b>
│           ├──<b>themes/</b>
│           └──<b>widgets/</b>
</pre>
- **app/**: Inside the app folder are the Views and Controllers of the application screens, responsible for displaying the UI and the information displayed on it
- **shared/**: Inside the Shared folder are the shared attributes used throughout the application
- **models/**: Following the MVC format, inside the Models folder are the objects used in the app
- **repository/**: Following the Repository standard, this folder contains the repositories responsible for connecting to the API
- **service/**: Following the service pattern as a whole, this folder contains the logic of the external UI control services, such as converting the elements obtained from the API into a tree structure.
- **state/**: Inside the states folder, we have the classes that determine the state of the application, such as Complete, Loading and Failure.
- **utils/**: In the utils folder we have the useful files for building the UI
- **themes/**: In the themes folder we have the file containing the theme generated for the app
- **widgets/**:  In this folder we have the Widgets created externally to optimize the app's code and performance




## Video Preview:
https://github.com/user-attachments/assets/ce839c34-2be1-44f6-90fa-e16c6270380e



