import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/517Nhj617jL._AC_UX342_.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/61FjkEaXTNL._UX466_.jpg'),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://n.nordstrommedia.com/id/sr3/8e626d44-ac02-4e28-b87b-6196f6dbaabf.jpeg?h=365&w=240&dpr=2',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (context, i) => ProductItem(
          id: loadedProducts[i].id,
          title: loadedProducts[i].title,
          imageUrl: loadedProducts[i].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
