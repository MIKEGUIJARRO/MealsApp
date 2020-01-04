import 'package:flutter/material.dart';

import './dummy-data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal){
        if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["vegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                //Copy with permite suplir valores que se tienen por default
                //con otros que se sobreescriben.
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontSize: 20,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.bold),
              )),
      //home: CategoriesScreens(),
      initialRoute: "/",
      routes: {
        // "/": (ctx)=> CategorieScreens() nos permite entrar como una ruta por default.
        "/": (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      /* En caso de que nuestra navegacion estandar llegue a fallar,
          esta configuracion nos permite entrar a una ruta por default
          */
      onGenerateRoute: (routeSettings) {
        print(routeSettings.arguments);
        return MaterialPageRoute(builder: (buildCtx) => CategoriesScreen());
      },
      /* Este metodo es el ultimo recurso que usa flutter para revisar las 
      rutas que tiene disponibles antes de que ejecute un error.
      Este metodo se activa en caso de que no se tenga ninguna ruta disponible.
      El equivalente en web de la pagina 404 no existe.*/
      onUnknownRoute: (routeSettings) {
        return MaterialPageRoute(builder: (buildCtx) => CategoriesScreen());
      },
    );
  }
}
