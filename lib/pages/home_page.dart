import 'package:flutter/material.dart';
import 'package:shopping_app/pages/product_list.dart';

import 'cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentPage=0;
  List<Widget> pages=[const ProductList(),const CartPage()];
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:IndexedStack(
        index: currentPage,
        children:pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value){
          setState(() {
            currentPage=value;
          });
        },
        currentIndex: currentPage,
        items: const [

          BottomNavigationBarItem(icon:  Icon(Icons.home) ,
            label:' ',
        ),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),
        label: ' '
      ),
    ],
    ),

    );
  }
}
