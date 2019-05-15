import 'package:flutter/material.dart';
import 'package:arumosum/components/colors.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orrangeColor,
        centerTitle: true,
        leading: IconButton(
          tooltip: 'back to the main',
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Container(
              child: Image.asset(
            'images/logo.png',
            fit: BoxFit.cover,
          )),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            tooltip: 'Shopping cart',
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Container(
        color: gray,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}
