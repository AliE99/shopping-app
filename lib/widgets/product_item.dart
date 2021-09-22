import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          leading: FavoriteButton(
            iconSize: 40.0,
            valueChanged: (_isFavorite) {
              print('Is Favorite $_isFavorite');
            },
          ),
          trailing: IconButton(
            color: Colors.white,
            icon: Icon(Icons.add_shopping_cart_outlined),
          ),
        ),
      ),
    );
  }
}
