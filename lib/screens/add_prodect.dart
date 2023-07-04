// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/helper/Show_SnakBar.dart';
import 'package:store_app/screens/login_page.dart';
import 'package:store_app/services/addproduct.dart';
import 'package:store_app/widegt/custom_button.dart';
import 'package:store_app/widegt/custom_textfield.dart';

class AddProdectService extends StatefulWidget {
  static String id = 'AddProduct';

  const AddProdectService({super.key});

  @override
  State<AddProdectService> createState() => _AddProdectServiceState();
}

class _AddProdectServiceState extends State<AddProdectService> {
  String? ProductName, image, desc, price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
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
            'Add Product',
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
                const SizedBox(height: 100,),
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
                  text: 'Add New Prodect',
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await AddProdectService();
                      // ignore: avoid_print
                      print('success');
                      // ignore: use_build_context_synchronously
                      ShowSnakBar(context, 'The New prodect Add success');
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

  Future<void> AddProdectService() async {
    await AddProduct().AddProducts(
      title: ProductName!,
      price: price!,
      description: desc!,
      image: image!,
      category: '',
    );
  }
}
