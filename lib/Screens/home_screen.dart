// ignore_for_file: unused_field, use_key_in_widget_constructors, prefer_final_fields, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_project/models/recipe.dart';
import 'package:flutter_application_project/models/recipe_api.dart';
import 'package:flutter_application_project/views/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 101, 173),
          title: const Text(
            'Food Recipe',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IterableProperty<Recipe>('_recipes', _recipes));
  // }
}
