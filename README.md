# Daily Quote Explorer

Daily Quote Explorer is a Flutter mobile application that displays motivational quotes and allows users to save their favorite quotes.  
Users can view, delete, and search their favorite quotes easily.

 # **Features** 

 **Home Screen**

• Displays a random inspirational quote

• Shows quote author

• “New Quote” button to generate a random quote

• “Save to Favorites” button

• Prevents duplicate favorites

**Favorites Screen** 
• View all saved favorite quotes

• Search bar to filter favorite quotes

• Remove quotes from favorites

• Favorites persist even after app restart

**Navigation** 
Uses BottomNavigationBar to switch between:Home and Favorites.

Local Storage - Uses SharedPreferences to persist favorite quotes

 **Tech Stack -** Flutter, Dart, Provider (State Management),SharedPreferences (Local Storage)
 
 # **Architecture**

Model → Quote (id, text, author) , 
State Management → Provider

Folder Structure - 
lib/
 ├── models/
 │    └── quote.dart
 ├── providers/
 │    └── quote_provider.dart
 ├── screens/
 │    ├── home_screen.dart
 │    └── favorite_screen.dart
 └── main.dart


# **Setup Instructions**

**1️) Install Requirements**
Flutter SDK

Android Studio

Android Emulator

**2️) Emulator Setup**
Open Android Studio  

Created using: Android Studio → Virtual Device Manager

Go to More Actions → Virtual Device Manager

Created device:
 1) device - Pixel 6
 2) Android version - API 34
    
Start emulator

**3️) Run Project**

flutter pub get

flutter run

**Testing** - This project includes unit tests and widget tests.

- `quote_provider_test.dart` – Unit tests for QuoteProvider logic
- `home_screen_test.dart` –  Widget tests for Home Screen UI

**Run Tests** - ```bash,flutter test - This command runs all unit and widget tests in the test/ folder and verifies that the app works correctly.


# **Screenshots**

# **Favorites Screen**

<img width="502" height="1011" alt="Favorites" src="https://github.com/user-attachments/assets/b0918f5b-9404-43ff-bf95-bac062e28104" />

# **Home Screen**

![Home](https://github.com/user-attachments/assets/4870de75-383b-40be-bed7-b17094ac8ae2)


### Extra Features
• Prevented duplicate quotes from being added to Favorites.

• Favorites are persisted using SharedPreferences (saved even after app restart).

• Added search functionality in Favorites to filter quotes.

• Bottom navigation bar for smooth navigation between Home and Favorites.

• Unit and widget tests for core functionality.





