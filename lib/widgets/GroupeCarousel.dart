import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselModel extends ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

class GroupeCarousele extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/image/gr.png.png',
    'assets/image/gr.png.png',
    'assets/image/gr.png.png',
    'assets/image/gr.png.png'
    // Ajoutez d'autres chemins d'image au besoin
  ];

  final CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarouselModel>(
      create: (context) => CarouselModel(),
      child: Column(
        children: [
          CarouselSlider(
            items: imagePaths.map((imagePath) {
              return Image.asset(
                imagePath,
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              height: 240,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                final carouselModel =
                    Provider.of<CarouselModel>(context, listen: false);
                carouselModel.updateIndex(index);
              },
            ),
            carouselController: buttonCarouselController,
          ),
          Consumer<CarouselModel>(
            builder: (context, carouselModel, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imagePaths.map((imagePath) {
                  int index = imagePaths.indexOf(imagePath);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: carouselModel.currentIndex == index
                          ? Colors.red
                          : Colors.green,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}


