import 'package:flutter/material.dart';
import 'package:restaurant_app/model/resto.dart';

class Drink extends StatelessWidget {
  final Restaurant resto;

  const Drink({@required this.resto});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: resto.menus.foods.map((drinks) {
          return Text(drinks.name);
        }).toList(),
      ),
    );
  }
}
