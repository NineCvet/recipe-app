# Recipe App

A Flutter web application for browsing and discovering recipes from around the world. Built using TheMealDB API to provide users with a rich collection of recipes across various cuisines and categories.

## Features

- **Category Browse**: Explore recipes organized by meal categories (Seafood, Beef, Chicken, Dessert, etc.)
  - 4-column responsive grid layout
  - Category images with descriptions
  - Real-time search filtering
- **Category Selection**: 
  - Quick access list view for all categories
  - Visual category selector with thumbnails
- **Recipe Discovery**:
  - Grid view of dishes within each category
  - Local search with API fallback
  - High-quality recipe images
- **Detailed Recipe View**:
  - Split layout design with recipe image and ingredients
  - Numbered step-by-step instructions in a card format
  - Complete ingredient list with measurements
  - YouTube video integration for cooking tutorials
  - Category and cuisine tags
- **Random Recipe**: Discover new recipes with the shuffle feature
- **Search Functionality**: 
  - Filter categories by name
  - Search dishes within selected categories
  - API-powered global recipe search

## Design

- **Color Scheme**: Orange primary theme with Material Design 3
- **Layout**:
  - 5/4-column grid for optimal viewing
  - Split-view recipe details (image/ingredients + instructions)
  - Card-based UI with shadows and elevation
  - Responsive padding and margins
- **UI Elements**:
  - Custom styled chips for categories and cuisines
  - Elevated buttons with drop shadows
  - Cached network images for performance
  - Scroll-to-top floating action button

## Technologies

- **Framework**: Flutter
- **Language**: Dart
- **API**: TheMealDB (https://www.themealdb.com/api.php)
- **State Management**: StatefulWidget with async data loading
- **Packages**:
  - `http` - API requests
  - `cached_network_image` - Image caching and loading
  - `url_launcher` - External link handling (YouTube)
- **Architecture**: 
  - Models: Category, Meal, MealDetail
  - Services: API service layer
  - Screens: Home, Meals, MealDetail
  - Widgets: Reusable card components