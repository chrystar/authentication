# Flutter Authentication App

This Flutter project provides a robust authentication system with features like biometric login (fingerprint), traditional login, and user registration. It is designed to offer a seamless and secure user experience.

## Features

- **Biometric Authentication**: Supports fingerprint login for quick and secure access.
- **Traditional Login**: Allows users to log in using their credentials.
- **User Registration**: Enables new users to register and create an account.
- **Error Handling**: Provides user-friendly feedback for authentication errors.
- **Navigation**: Smooth navigation between login, registration, and home screens.

## Screens

1. **Quick Login Screen**:
   - Displays options for biometric login, traditional login, and registration.
   - Includes a fingerprint icon for biometric authentication.

2. **Login Screen**:
   - Allows users to log in using their email and password.

3. **Register Screen**:
   - Enables new users to register by providing their details.

4. **Home Screen**:
   - The main screen users are navigated to after successful authentication.

## Project Structure

```
lib/
├── features/
│   ├── auth/
│   │   ├── login/
│   │   │   └── views/
│   │   │       └── login_screen.dart
│   │   ├── quick_login/
│   │   │   └── view/
│   │   │       └── quick_login.dart
│   │   ├── registers/
│   │   │   └── views/
│   │   │       └── register_screen.dart
│   │   └── widgets.dart
│   └── Screens/
│       └── home_page/
│           └── home_page.dart
```

## Setup Instructions

Follow these steps to set up and run the project:

### Prerequisites

- Flutter SDK installed on your system.
- A device or emulator with biometric capabilities (for fingerprint login).
- A code editor like Visual Studio Code or Android Studio.

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd authentication
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Configuration

- Ensure your device/emulator supports biometric authentication.
- Add the following permissions to your `AndroidManifest.xml` for Android:
  ```xml
  <uses-permission android:name="android.permission.USE_BIOMETRIC" />
  <uses-permission android:name="android.permission.USE_FINGERPRINT" />
  ```

- For iOS, update the `Info.plist` file:
  ```xml
  <key>NSFaceIDUsageDescription</key>
  <string>We use Face ID to authenticate you.</string>
  ```

## Dependencies

The project uses the following Flutter packages:

- [`local_auth`](https://pub.dev/packages/local_auth): For biometric authentication.
- [`flutter`](https://flutter.dev): The Flutter framework for building the app.

## How It Works

1. **Biometric Authentication**:
   - The app checks if the device supports biometrics and if any biometric methods are enrolled.
   - If supported, users can authenticate using their fingerprint.
   - Upon successful authentication, users are navigated to the home screen.

2. **Fallback Mechanism**:
   - If biometrics are unavailable or not enrolled, the app provides feedback to the user.

3. **Traditional Login and Registration**:
   - Users can log in or register using their credentials.

## Screenshots

### Quick Login Screen
![Quick Login Screen](./Screenshot_1.png)

### Login Screen
![Login Screen](./Screenshot_2.png)

### Register Screen
![Register Screen](./Screenshot_3.png)

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add feature-name"
   ```
4. Push to the branch:
   ```bash
   git push origin feature-name
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, feel free to reach out:

- **Email**: your-email@example.com
- **GitHub**: [Your GitHub Profile](https://github.com/your-profile)

