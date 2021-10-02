import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/widgets/badge.dart';
import 'package:shopping_app/widgets/products_grid.dart';

enum filterOptions { showAll, showFavorites }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Show All'),
                value: filterOptions.showAll,
              ),
              PopupMenuItem(
                child: Text('Show Favorites Only'),
                value: filterOptions.showFavorites,
              ),
            ],
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.showAll) {
                  _showOnlyFavorites = false;
                } else {
                  _showOnlyFavorites = true;
                }
              });
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
