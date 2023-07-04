import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/screens/add_prodect.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widegt/custom_card.dart';

class HomePage extends StatelessWidget {
  
  static String id = 'HomePage';

  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProdectService.id);
            },
            icon: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductsModels>>(
          future: GetAllProducts().AllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductsModels> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: products[index],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
