import 'package:flutter/material.dart';
import 'package:web/blocs/cart/cart.blocs.dart';
import 'package:web/widgets/web-app-bar.dart';

import '../blocs/cart/cart.events.dart';
import '../widgets/card.dart';
import '../widgets/mobile-app-bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
   late final CartBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CartBloc();
    bloc.add(LoadCartEvent());
  }

  getNumberOfColumns (double pageWidth) {
    if(pageWidth <= 600) {
      return 2;
    }
    if(pageWidth <= 960) {
      return 4;
    }
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        var pageWidth = constraints.maxWidth;
        var barHeight = AppBar().preferredSize.height;

        return Scaffold(
          appBar: pageWidth < 600 ?
            PreferredSize(child: MobileAppBar(), preferredSize: Size(pageWidth, barHeight)) :
            PreferredSize(child: WebAppBar(), preferredSize: Size(pageWidth, barHeight)),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: this.getNumberOfColumns(pageWidth),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                ProductCard( "muito bom para andar de skate e bike", "Nome do objeto","110.00" ,["http://placeimg.com/640/480/business"] )
              ],
            ),
          ) ,
          );
      }
    );
  }
}

class ProductBloc {
}