import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';
import '../models/meal_detail.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/categories.php'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List categories = data['categories'] ?? [];
        return categories.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/filter.php?c=$category'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List meals = data['meals'] ?? [];
        return meals.map((json) => Meal.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MealDetail?> getMealDetail(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/lookup.php?i=$id'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List meals = data['meals'] ?? [];
        if (meals.isNotEmpty) {
          return MealDetail.fromJson(meals[0]);
        }
        return null;
      } else {
        throw Exception('Failed to load meal detail');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MealDetail?> getRandomMeal() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/random.php'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List meals = data['meals'] ?? [];
        if (meals.isNotEmpty) {
          return MealDetail.fromJson(meals[0]);
        }
        return null;
      } else {
        throw Exception('Failed to load random meal');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Meal>> searchMeals(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search.php?s=$query'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List? meals = data['meals'];
        if (meals == null) return [];
        return meals.map((json) => Meal.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search meals');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}