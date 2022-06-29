import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pelíuclas en cine"),
          elevation: 0,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: Column(
          children: [
            CardSwiper(),
          ],
        ));
  }
}
