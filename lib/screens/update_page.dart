import 'package:flutter/material.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/services/updateproduct.dart';
import 'package:store_app/widegt/custom_button.dart';
import 'package:store_app/widegt/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/Show_SnakBar.dart';
import 'login_page.dart';

class UpdateProdectPage extends StatefulWidget {
  static String id = 'updateprodect';
  const UpdateProdectPage({super.key});

  @override
  State<UpdateProdectPage> createState() => _UpdateProdectPageState();
}

class _UpdateProdectPageState extends State<UpdateProdectPage> {
  // ignore: non_constant_identifier_names
  String? ProductName, image, desc, price;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductsModels prodect =
        ModalRoute.of(context)!.settings.arguments as ProductsModels;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.grey,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                textfield(
                  onchanged: (data) {
                    ProductName = data;
                  },
                  hinttext: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    desc = data;
                  },
                  hinttext: 'Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    price = data;
                  },
                  hinttext: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    image = data;
                  },
                  hinttext: 'Image',
                ),
                const SizedBox(
                  height: 70,
                ),
                button(
                  text: 'Updata',
                  onTap: () async {
                    isloading = true;
                    setState(() {});

                    try {
                      await UpdateProdectService(prodect);
                      // ignore: use_build_context_synchronously
                      ShowSnakBar(context, 'The New prodect Add success');
                      // ignore: avoid_print
                      print('success');
                    } catch (e) {
                      // ignore: avoid_print
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> UpdateProdectService(ProductsModels prodect) async {
    await UpdateProductService().UpdateProducts(
        id: prodect.id,
        title: ProductName == null ? prodect.title : ProductName!,
        price: price == null ? prodect.price.toString() : price!,
        description: desc == null ? prodect.description : desc!,
        image: image == null ? prodect.image : image!,
        category: prodect.category);
  }
}
