Weather AI App ☀️🌧️🌍
Welcome to the Weather AI App! This app leverages AI to provide accurate weather predictions, integrates Firebase for authentication, features Google Maps for location services, and follows a clean architecture pattern. Beautiful icons and design elements are incorporated to ensure an aesthetically pleasing and user-friendly experience. Additionally, there’s a dedicated section for videos, enhancing the user interaction with dynamic content.

Features
AI-Powered Weather Forecasts 🌤️: Get the latest and most accurate weather updates using advanced AI algorithms.
Firebase Authentication 🔐: Secure authentication using Firebase, enabling users to sign in with their Google or email accounts.
Google Maps Integration 📍: Seamless integration with Google Maps for location-based weather updates.
Clean Architecture 🏗️: Organized and scalable codebase built using Clean Architecture principles.
Beautiful Icons and Design 🎨: A modern and intuitive UI with high-quality icons for weather, navigation, and user actions.
Video Section 🎥: Watch interactive videos to stay updated on the latest weather tips and forecasts.
Getting Started
Prerequisites
Flutter SDK: Ensure that Flutter is installed on your machine.
Firebase Account: Set up a Firebase project to enable authentication.
Google Maps API Key: Obtain an API key from the Google Cloud Console for location services.
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/weather-ai-app.git
cd weather-ai-app
Install dependencies:

bash
Copy code
flutter pub get
Configure Firebase:

Go to the Firebase Console and set up a new project.
Enable Authentication and add Google sign-in.
Download the google-services.json file and place it in your app’s android/app directory.
Configure Google Maps:

Get your API key from the Google Cloud Console.
Add the following to your AndroidManifest.xml:
xml
Copy code
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
Run the app:

bash
Copy code
flutter run
Clean Architecture Overview 🏛️
The app is structured based on Clean Architecture, promoting separation of concerns and testability:

Presentation Layer 🖼️: Contains UI elements and view models.
Domain Layer 💼: Handles business logic and use cases.
Data Layer 🗄️: Manages data sources (remote and local).
Screenshots 📸
Here are a few snapshots of the app showcasing its elegant UI and beautiful icons:


Video Section 🎬
Our app includes a dedicated video section where users can watch informative videos about weather trends, tips, and forecasts.

To add videos, upload your content to the app’s Firebase Storage or link to a video hosting platform.
Videos can be played within the app, offering a seamless and immersive experience.
Beautiful Icons 🖌️
The app makes extensive use of custom-designed icons to enhance user experience:

Weather Icons 🌦️: Displays dynamic icons for sunny, rainy, cloudy, and other weather conditions.
Example:
Navigation Icons 🧭: Smooth navigation through icons such as home, location, and settings.
Example:
Authentication Icons 🔒: Clean and simple icons for login and logout actions.
Example:
The app uses icon libraries like FontAwesome or Custom SVG Icons to deliver crisp and scalable graphics across different devices.

Contributing 🤝
Contributions are welcome! Feel free to open an issue or submit a pull request.

Development Setup
Fork the repository
Create a new branch (git checkout -b feature-branch)
Make your changes
Commit your changes (git commit -am 'Add new feature')
Push to the branch (git push origin feature-branch)
Create a new Pull Request
License 📜
This project is licensed under the MIT License.
