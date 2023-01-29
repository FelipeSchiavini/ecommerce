


import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String description;
  String name;
  List<String> image;
  String price;

  ProductCard(this.description, this.name, this.price, this.image);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
        color: Colors.white
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Image.network('https://picsum.photos/250?image=9'),
            ),
            Expanded(
            flex: 1,
            child: Text(this.name),
            ),
            Expanded(
            flex: 2,
            child: AutoSizeText(
              this.description,
              style: TextStyle(fontSize: 14),
              maxLines: 2,
              minFontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
            ),
            Expanded(
            flex: 1,
            child: Text("R\$ ${this.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            )
      ]),
    );
  }
}


