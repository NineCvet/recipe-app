class MealDetail {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strYoutube;
  final List<Ingredient> ingredients;

  MealDetail({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strYoutube,
    required this.ingredients,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredients = [];
    
    for (int i = 1; i <= 20; i++) {
      String ingredient = json['strIngredient$i'] ?? '';
      String measure = json['strMeasure$i'] ?? '';
      
      if (ingredient.isNotEmpty && ingredient.trim().isNotEmpty) {
        ingredients.add(Ingredient(
          name: ingredient,
          measure: measure,
        ));
      }
    }

    return MealDetail(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strYoutube: json['strYoutube'] ?? '',
      ingredients: ingredients,
    );
  }
}

class Ingredient {
  final String name;
  final String measure;

  Ingredient({
    required this.name,
    required this.measure,
  });
}