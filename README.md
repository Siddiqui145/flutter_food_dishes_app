# 🍽️ Flutter Food Dishes App

## 📌 Overview  
The **Flutter Food Dishes App** is a beautifully designed recipe app that allows users to explore a variety of dishes, filter recipes based on dietary preferences, and save their favorite meals.  

## 🎯 Features  
- **📸 Display Recipes** – Browse through delicious recipes with images and step-by-step guides.  
- **🔍 Filter Recipes** – Filter meals based on dietary preferences (e.g., gluten-free, vegan, lactose-free).  
- **❤️ Favorites** – Save favorite recipes for quick access.  
- **📌 Categories** – Organize dishes into different cuisine types such as Italian, Asian, and more.  
- **⚡ Dynamic UI** – Smooth navigation with an intuitive interface.  

## 📂 Project Structure  
```
/lib
│── main.dart                # Entry point of the app
│── screens
│   │── categories_screen.dart       # Displays meal categories
│   │── category_meals_screen.dart   # Shows meals based on selected category
│   │── meal_detail_screen.dart      # Detailed meal instructions & ingredients
│   │── filters_screen.dart          # Filtering options
│── widgets
│   │── category_item.dart           # UI component for displaying categories
│   │── meal_item.dart               # UI component for displaying meals
│   │── main_drawer.dart             # UI component for custom drawer
│── models
│   │── category.dart                # Model for meal categories
│   │── meal.dart                    # Model for meal details
│── data
│   │── dummy_data.dart               # Contains the list of meals & categories
```

## 🚀 Installation & Setup  
1. **Clone the Repository**  
   ```sh
   git clone https://github.com/Siddiqui145/flutter_food_dishes_app.git
   cd flutter_food_dishes_app
   ```

2. **Install Dependencies**  
   ```sh
   flutter pub get
   ```

3. **Run the App**  
   ```sh
   flutter run
   ```

## 🛠️ Technologies Used  
- **Flutter** – Cross-platform mobile framework  
- **Dart** – Programming language  
- **Provider (optional)** – State management  


## 🎨 UI & Screenshots  
(Add screenshots of your app here)  

## 📌 Future Enhancements  
- [ ] **Dark Mode Support**  
- [ ] **User Authentication (Sign-in, Sign-up)**  
- [ ] **Cloud Sync for Favorites**  
- [ ] **Push Notifications for New Recipes**  

## 🤝 Contribution  
Feel free to contribute! Fork the repo, make changes, and submit a pull request.  

## 📜 License  
This project is licensed under the MIT License.  
