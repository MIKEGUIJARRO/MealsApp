import 'package:flutter/material.dart';
import './screens/filters_screen.dart';

import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
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
        "/": (ctx)=> TabsScreen(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx)=> MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=> FiltersScreen(),

      },
      /* En caso de que nuestra navegacion estandar llegue a fallar,
          esta configuracion nos permite entrar a una ruta por default
          */
      onGenerateRoute: (routeSettings) {  
        print(routeSettings.arguments);
        return MaterialPageRoute(builder: (buildCtx)=> CategoriesScreen());
      },
      /* Este metodo es el ultimo recurso que usa flutter para revisar las 
      rutas que tiene disponibles antes de que ejecute un error.
      Este metodo se activa en caso de que no se tenga ninguna ruta disponible.
      El equivalente en web de la pagina 404 no existe.*/
      onUnknownRoute: (routeSettings) {
        return MaterialPageRoute(builder: (buildCtx)=> CategoriesScreen());
      },
    );
  }
}
