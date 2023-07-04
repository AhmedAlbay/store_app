import 'package:flutter/material.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/screens/update_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.product});

  ProductsModels product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProdectPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 20,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.substring(0, 15),
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            right: 32,
            bottom: 80,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    );
  }
}
