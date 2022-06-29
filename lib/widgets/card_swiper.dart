import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: deviceSize.height * 0.5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: deviceSize.width * 0.6,
        itemHeight: deviceSize.width * 0.8,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/details", arguments: {}),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage("assets/loading.gif"),
                image: NetworkImage("https://via.placeholder.com/300x400"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
