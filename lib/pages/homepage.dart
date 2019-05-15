import 'package:arumosum/data/store.dart';
import 'package:flutter/material.dart';
import 'package:arumosum/components/colors.dart';
import 'package:arumosum/components/carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: gray,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.00,
                      child: Carousel(),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Special Offers',
                          style: boldBlackMainTextStyle,
                          textAlign: TextAlign.left,
                        )),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            child: Container(
                              height: 120.0,
                              color: Colors.white,
                              child: Image.asset(
                                'images/caro (2).jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            child: Container(
                              height: 120.0,
                              color: Colors.white,
                              child: Image.asset(
                                'images/caro (3).jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Top Categories',
                          style: boldBlackMainTextStyle,
                          textAlign: TextAlign.left,
                        )),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Trending Now',
                          style: boldBlackMainTextStyle,
                          textAlign: TextAlign.left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 230.0,
                      width: MediaQuery.of(context).size.width,
                      child: new GridView.builder(
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return new GestureDetector(
                            onTap: () {
                              /* Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new ItemDetails(
                              itemImage: storeItems[index].itemImage,
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemRating: storeItems[index].itemRating,
                            )));*/
                            },
                            child: new Card(
                              child: Stack(
                                alignment: FractionalOffset.topLeft,
                                children: <Widget>[
                                  new Stack(
                                    alignment: FractionalOffset.bottomCenter,
                                    children: <Widget>[
                                      new Container(
                                        decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                                fit: BoxFit.fitWidth,
                                                image: new NetworkImage(
                                                    storeItems[index]
                                                        .itemImage))),
                                      ),
                                      new Container(
                                        height: 45.0,
                                        width: MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: new Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: new Column(
                                            children: <Widget>[
                                              new Text(
                                                "${storeItems[index].itemName}...",
                                                style: smallGrayTextStyle,
                                              ),
                                              new Text(
                                                "RS: ${storeItems[index].itemPrice}",
                                                style:
                                                    normalBlackSmallTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                        height: 30.0,
                                        width: 60.0,
                                        decoration: new BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: new BorderRadius.only(
                                              topRight:
                                                  new Radius.circular(5.0),
                                              bottomRight:
                                                  new Radius.circular(5.0),
                                            )),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            new Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 20.0,
                                            ),
                                            new Text(
                                              "${storeItems[index].itemRating}",
                                              style: new TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      new IconButton(
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {})
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
