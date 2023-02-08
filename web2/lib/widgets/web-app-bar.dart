import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text("Loja Virtual"),
          Expanded(child: Container()),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
          SizedBox(width: 10),
          OutlinedButton(onPressed: (){}, child: Text("Cadastrar"), style: OutlinedButton.styleFrom(backgroundColor: Colors.yellow, onSurface: Colors.black)),
          SizedBox(width: 10),
          OutlinedButton(onPressed: (){}, child: Text("Logar"), style: OutlinedButton.styleFrom(backgroundColor: Colors.yellow, onSurface: Colors.black)),
        ],
      ),
    );
  }
}
