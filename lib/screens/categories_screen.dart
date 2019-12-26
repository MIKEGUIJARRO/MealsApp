import 'package:flutter/material.dart';

import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    id: catData.id,
                    title: catData.title,
                    color: catData.color,
                  ))
              .toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, 
          //Por cada 1 que tengo en main axis, tengo 1.5 en cross axis
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
