import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/products/presentation/bloc/cart_bloc.dart';
import '../../modules/products/presentation/views/cart_view.dart';
import '../../modules/products/presentation/views/featured_products_view.dart';
import '../../modules/products/presentation/views/search_products_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _bodyOptions = [
    FeaturedProductsView(),
    SearchProductsView(),
    CartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Tienda'),
      ),
      body: Center(
        child: _bodyOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.blueGrey[100],
        currentIndex: _selectedIndex,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Populares',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return (state.totalProducts ?? 0) > 0
                    ? Badge(
                        position: BadgePosition.topStart(top: -10, start: 15),
                        animationDuration: Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          (state.totalProducts ?? 0).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(Icons.shopping_cart),
                      )
                    : Icon(Icons.shopping_cart);
              },
            ),
            label: 'Carrito',
          ),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
