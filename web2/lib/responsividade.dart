

import 'package:flutter/material.dart';

class ResponsividadeMediaQuery extends StatefulWidget {
  const ResponsividadeMediaQuery({super.key});

  @override
  State<ResponsividadeMediaQuery> createState() => _ResponsividadeMediaQueryState();
}

class _ResponsividadeMediaQueryState extends State<ResponsividadeMediaQuery> {
  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double statusBarHeight = MediaQuery.of(context).padding.top;
      double appBarHeight = AppBar().preferredSize.height;

      return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
        actions: const <Widget>[
          Icon(Icons.shopping_cart),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight - statusBarHeight - appBarHeight,
            color: Colors.blue,
          )
        ],
      )
              
    );
  }
}
