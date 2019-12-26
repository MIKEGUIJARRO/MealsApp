import 'package:flutter/material.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {

  //static const String routeName = "/tab";

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DUMMY HOLA"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorite",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            /* 
              Nota Cool:
              Hay que evitar que las pantallas que se carguen al TabBarView
              contengan Scaffolds widgets. De esta forma evitamos tener un appbar
              duplicado.
              El scaffold que tenemos en tabs_screen se hereda naturalmente a los 
              widgets que se carguen en la configuracion de tabs.
            */
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
