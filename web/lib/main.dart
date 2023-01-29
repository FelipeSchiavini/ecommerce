import 'package:flutter/material.dart';
import 'package:web/view/login.dart';

//create widget stl / stf + tab
void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

//class HomePage extends StatefulWidget {
//  List<Item> items = [];
//  
//  HomePage({super.key}){
//    items.add(Item(done: true, title: "study englush"));
//    items.add(Item(done: false, title: "I dont know"));
//  }
//
//  @override
//  State<HomePage> createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text("Ecommerce"),
//        leading: const Text("Oi"),
//        actions: const <Widget>[
//          Icon(Icons.shopping_cart),
//        ],
//      ),
//      body: ListView.builder(
//        itemCount: widget.items.length,
//        itemBuilder: (BuildContext context,int index ){
//          final item =widget.items[index]; 
//          return CheckboxListTile(
//              title: Text(item.title),
//              key: Key(item.title),
//              value: item.done,
//              onChanged:(value) => {
//                StepState
//              },
//            );
//        },
//      )
//    );
//  }
//}
//