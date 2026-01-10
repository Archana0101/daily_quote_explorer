# Daily Quote Explorer

Daily Quote Explorer is a Flutter mobile application that displays motivational quotes and allows users to save their favorite quotes.  
Users can view, delete, and search their favorite quotes easily.

 # **Features** 

 **Home Screen** 
  •Shows a random motivational quote from a hardcoded list (10+ quotes)

• Get New Quote button to generate a new quote

 • Save to Favorites button

**Favorites Screen** 
 • Displays all saved quotes

 • Option to delete any quote

 • Shows message when favorites list is empty

**Navigation** 
Uses BottomNavigationBar to switch between:Home and Favorites.

 # **Architecture**

Model → Quote (id, text, author) , 
State Management → Provider

Folder Structure - 
lib/
 ├── models/
 ├── providers/
 ├── screens/
 └── widgets/

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

# **Screenshots**

# **Favorites Screen**

<img width="502" height="1011" alt="Favorites" src="https://github.com/user-attachments/assets/b0918f5b-9404-43ff-bf95-bac062e28104" />

# **Home Screen**

![Home](https://github.com/user-attachments/assets/4870de75-383b-40be-bed7-b17094ac8ae2)



# **Extra Features:**
• Favorites persistence using SharedPreferences
• Search bar in Favorites to filter quotes




