
<!-- Table of Contents -->
# Table of contents:
- [Getting Started](#getting-started)
  - [Demo](#demo)
  - [Target Audience](#target-audience)
- [Environment Setup](#environment-setup)
  - [Software and Tools](#software-and-tools)
  - [Installation Instructions](#installation-instructions)
- [Project Architecture "Overview"](#project-architecture-overview)
- [Dependencies](#dependencies)
- [Project Status](#project-status)
  - [Status](#status)
  - [Progress Bar](#progress-bar)
  - [Phase](#phase)
- [Deployment](#deployment)
  - [App Deployment](#app-deployment)
  - [Release Notes](#release-notes)
- [Conclusion](#conclusion)
- [License](#license)

<hr style="border-top: 2px dashed #999;">

<!-- Getting Started -->
## Getting Started

### Demo

### Target Audience

This document is intended for developers, testers, and anyone involved in the development and maintenance of the **bünd** app.

<hr style="border-top: 2px dashed #999;">

<!-- Development Environment Setup -->
## Environment Setup

### Software and Tools

To set up the development environment for **bünd**, you'll need the following software and tools:

- Flutter SDK (v3.16.0 or later)
- Dart SDK (v3.2.2 or later)
- Android Studio or Visual Studio Code (with Flutter and Dart plugins)
- Git for version control

### Installation Instructions

- Install Flutter and Dart by following the official documentation "[Visit](https://flutter.dev/docs/get-started/install)".
- Configure your preferred IDE with the Flutter and Dart plugins.
- Open the whole app in your IDE.
- Clone the repository from Git & add it inside `pubspec.yaml`
- Run **`flutter pub get`** command.
- Create **Emulator/Simulator** Connect Physical Device:
    - Open a terminal in your IDE or use the terminal directly.
    - Run the command **`flutter run`** to build and launch your app on the connected emulator or device.
- Run the App:
    - To run your Flutter app, you'll need either an emulator or a physical device. You can create a virtual device using **Android Studio** or **Xcode**, depending on whether you are developing for Android or iOS.
    - If you prefer testing on a physical device, connect it to your computer and ensure that USB debugging is enabled.
- Resolve Dependencies:
    - If there are any missing dependencies or issues with packages, the terminal will guide you on how to resolve them. You may need to run additional commands like **`flutter pub upgrade`** or **`flutter packages get`** to ensure that all dependencies are installed.

<hr style="border-top: 2px dashed #999;">

<!-- Project Architecture** Overview -->
## Project **Architecture** "Overview"

The **bünd** app adheres to the principles of Clean Architecture, promoting separation of concerns and maintainability. Our architecture comprises the following key components:

- Presentation Layer: Manages the user interface, screens, and UI logic.
- Domain Layer: Contains the core business logic and use cases.
- Data Layer: Handles data access and storage, including external APIs and databases.

In addition to Clean Architecture, we leverage Flutter's widget-based UI development to create a responsive and intuitive user interface.


<!-- Dependencies -->
## Dependencies

| Name | Version | Usage |
| ---- | ------- | ----- |
| **UI** | | |
| [animations] | ^2.0.8 | Fancy pre-built animations that can easily be integrated into any Flutter application. |
| [animate_do] | ^3.1.2 | An animation package inspired in [Animate.css](https://animate.style/). |
| [flutter_svg] | ^2.0.5 | To deal with svg icons. |
| [gap] | ^3.0.1 | Flutter widgets for easily adding gaps inside Flex widgets such as Columns and Rows or scrolling views. |
| [smooth_page_indicator] | ^1.1.0 | Customizable animated page indicator with a set of built-in effects. |
| [shimmer] | ^3.0.0 | A package provides an easy way to add shimmer effect in Flutter project. |
| [in_app_notification] | ^1.1.2 | A Flutter package to show custom in-app notification with any Widgets. |
| [showcaseview] | ^2.0.3 | A Flutter package allows you to Showcase/Highlight your widgets step by step. |
| [liquid_pull_to_refresh] | ^3.0.1 | A Flutter package to add a pull to refresh feature. |
| **Logic** | | |
| [flutter_bloc] | ^8.1.3 | To manage state and separate business logic from UI. |
| [equatable] | ^2.0.5 | Equality comparisons among objects. |
| [intl] | ^0.19.0 | Provides internationalization and localization facilities. |
| [path_provider] | ^2.1.1 | A Flutter plugin for finding commonly used locations on the filesystem. |
| [hive] | ^2.2.3 | Hive is a lightweight and blazing fast key-value database. |
| [flutter_tts] | ^3.8.5 | A flutter text to speech plugin (Swift,Kotlin) |

#### Further details: [Go](pubspec.yaml)

<!-- Project Status -->
## Project Status

### Status
<!-- <mark>🛑 Pre-Development</mark> -->
- [x] `⏳ Initialization`
- [x] `👨🏻‍💻 In Progress`
- [~] `🔍 Review`
- [ ] `✅ Completed`

### Progress Bar
![](https://progress-bar.dev/100?title=Danger)
<!-- ![](https://progress-bar.dev/5?title=help) -->
<!-- ![](https://geps.dev/progress/32?dangerColor=800000&warningColor=ff9900&successColor=006600) -->

### Phase
- [x] `🖌️ Design`
- [x] `👨🏻‍💻 Development`
- [~] `🚀 Deployment`

<hr style="border-top: 2px dashed #999;">

<!-- Deployment -->
## Deployment

### App Deployment

The **bünd** app is deployed on the following platforms:

- **Android**: The app can be downloaded from the Play Store. [APK](bünd.apk)
- **iOS**: The app can be downloaded from the Apple App Store.

### Release Notes:

`Version 1.0.0`: Initial release with the following features:

- [x] Splash
- [x] Page Not Found
- [x] Bottom Navigation
    - [x] Page Transition Animation
    - [x] Tabs Animation
- [x] Home
    - [x] Animations
    - [x] Shimmer Effect
    - [x] Glow Effect
    - [x] Pull to refresh
    - [x] Show Case
    - [x] Snap Page Scrolling
    - [x] Dynamic Card Updates
    - [x] Slider
    - [x] Swipeable Interface
    - [x] Error Handling
- [x] Fixed Income
    - [x] Animations
    - [x] Shimmer Effect
    - [x] Glow Effect
    - [x] Pull to refresh
    - [x] Scroll Up/Down
    - [x] Text to Speech
    - [x] Haptic feedback
    - [x] User Notification
    - [x] Persistence
    - [x] Mock Data
    - [x] State Management **BLoC**
    - [x] Error Handling
    - [x] Code Organization

<!-- 
- [x] Completed task
- [~] Inapplicable task
- [ ] Incomplete task
-->

<hr style="border-top: 2px dashed #999;">

<!-- Conclusion -->
## Conclusion

This technical documentation serves as a comprehensive guide to the architecture, development, and deployment of the **bünd** app. It provides valuable insights into the codebase's organization, functionality, and integration with external services.

<!-- License -->
## License

© 2023 Samir Hassan. All Rights Reserved.

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [animations]: <https://pub.dev/packages/animations/>
   [animate_do]: <https://pub.dev/packages/animate_do/>
   [flutter_svg]: <https://pub.dev/packages/flutter_svg/>
   [gap]: <https://pub.dev/packages/gap/>
   [smooth_page_indicator]: <https://pub.dev/packages/smooth_page_indicator/>
   [shimmer]: <https://pub.dev/packages/gap/>
   [in_app_notification]: <https://pub.dev/packages/flutter_svg/>
   [showcaseview]: <https://pub.dev/packages/showcaseview/>
   [showcaseview]: <https://pub.dev/packages/showcaseview/>
   [liquid_pull_to_refresh]: <https://pub.dev/packages/liquid_pull_to_refresh/>
   [flutter_bloc]: <https://pub.dev/packages/flutter_bloc/>
   [equatable]: <https://pub.dev/packages/equatable/>
   [intl]: <https://pub.dev/packages/intl/>
   [path_provider]: <https://pub.dev/packages/path_provider/>
   [hive]: <https://pub.dev/packages/hive/>
   [flutter_tts]: <https://pub.dev/packages/flutter_tts/>