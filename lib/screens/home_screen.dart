import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/text_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/images/landing/buy-on-laptop.jpg',
    'assets/images/landing/buy-through.png',
    'assets/images/landing/buyfood.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/store.jpg',
    'assets/images/landing/vergtablebg.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Utils utils = Utils(context);
    Size size = utils.size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.33,
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: images.length,
              pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                      size: 10.0,
                      activeSize: 10.0)),
            ),
          ),
          SizedBox(height: 5,),
          TextButton(
              onPressed: () {},
              child: TextWidget(
                text: "View all",
                color: Colors.blue,
                textSize: 20,
                maxLines: 1,
              )),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Row(
                  children: [
                    TextWidget(text: 'On Sale'.toUpperCase(), color: Colors.red, textSize: 22,isTitle: true,),
                    const SizedBox(width: 5,),
                    Icon(IconlyLight.discount,color: Colors.red,)
                  ],
                ),
              ),
              const SizedBox(width: 8,),
              Flexible(
                child: SizedBox(
                  height: size.height * 0.24,
                  child: ListView.builder(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return OnSaleWidget();
                      }),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
