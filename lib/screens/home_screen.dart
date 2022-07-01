import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomScreen extends StatelessWidget {
  const HomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pelíuclas en cine"),
        elevation: 0,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //Tajetas principales
            CardSwiper(),
            //Slider Peliculas
            MovieSlider()
          ],
        ),
      ),
    );
  }
}
