import 'package:restaurant_app/model/resto.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/page/detail_page.dart';

class RestoListPage extends StatelessWidget {
  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ala Resto'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              final List<Restaurant> restos = parseRestaurant(snapshot.data);
              return ListView.builder(
                itemBuilder: (context, index) {
                  return _buildRestoItem(context, restos[index]);
                },
                itemCount: restos.length,
              );
            } else {
              return Text("Data tidak ditemukan");
            }
          }
        },
      ),
    );
  }

  Widget _buildRestoItem(BuildContext context, Restaurant resto) {
    return Card(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: resto.id,
          child: Image.network(
            resto.pictureId,
            width: 100,
          ),
        ),
        isThreeLine: true,
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            resto.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.blueGrey[200],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(resto.city)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.blueGrey[100],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(resto.rating)
                ],
              ),
            )
          ],
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, RestoDetailPage.routeName,
              arguments: resto);
        },
      ),
    );
  }
}
