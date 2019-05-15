import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _current= 0;
  List imgList = [
    'images/caro (1).jpg','images/caro (2).jpg','images/caro (3).jpg','images/caro (4).jpg'
  ];
  List<T> map<T>(List list,Function handler){
    List<T> result =[];
    for(var i=0; i<list.length;i++){
      result.add(handler(i,list[i]));
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [ CarouselSlider(
  height: 150.0,
  enlargeCenterPage: true,
  autoPlay: true,
  pauseAutoPlayOnTouch:Duration(seconds: 5),
  enableInfiniteScroll: true,
  autoPlayInterval:Duration(seconds: 3),
  onPageChanged: (index){
    setState(() {
     _current = index;
  });
  },
  items: imgList.map((imgUrl) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: Image.asset(imgUrl,fit:BoxFit.fill)
          );
        },
      );
  }).toList(),
),
Positioned(
          
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imgList, (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.orange : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              );
            }),
          ))
          ]);
  }
}