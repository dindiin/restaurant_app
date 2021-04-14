import 'package:flutter/material.dart';
import 'package:restaurant_app/model/resto.dart';
import 'package:restaurant_app/style/style.dart';

class RestoDetailPage extends StatelessWidget {
  static const routeName = '/resto_detail';

  final Restaurant resto;

  const RestoDetailPage({@required this.resto});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: resto.id,
                  child: Image.network(resto.pictureId),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10.0, bottom: 4.0),
                        child: Text(
                          resto.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0)),
                            color: primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            resto.rating,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            resto.city,
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0, bottom: 10.0),
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      resto.description,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Foods',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.15),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: resto.menus.foods.map((foods) {
                          return SizedBox(
                            width: 150.0,
                            height: 200.0,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Container(
                                      color: secondaryColor,
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.1)),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        foods.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: primaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Drinks',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.15),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: resto.menus.drinks.map((drinks) {
                          return SizedBox(
                            width: 150.0,
                            height: 200.0,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Container(
                                      color: secondaryColor,
                                      height:
                                          (MediaQuery.of(context).size.height *
                                              0.1)),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        drinks.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
