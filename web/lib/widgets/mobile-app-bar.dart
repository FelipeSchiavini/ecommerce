import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
            title: Text("Loja Virtual"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_rounded)),
              //TODO SUBSTITUIR POR https://api.flutter.dev/flutter/material/PopupMenuButton-class.html
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
            ],
          );
  }
}