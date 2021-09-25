import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: FavoriteButton(
            isFavorite: product.isFavorite,
            iconSize: 40.0,
            valueChanged: (_isFavorite) {
              product.changeFavoriteStatus(_isFavorite);
            },
          ),
          trailing: IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.add_shopping_cart_outlined),
          ),
        ),
      ),
    );
  }
}
