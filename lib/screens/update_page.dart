import 'package:flutter/material.dart';
import 'package:store_app/models/products.dart';
import 'package:store_app/services/updateproduct.dart';
import 'package:store_app/widegt/custom_button.dart';
import 'package:store_app/widegt/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProdectPage extends StatefulWidget {
  static String id = 'updateprodect';
  UpdateProdectPage({super.key});

  @override
  State<UpdateProdectPage> createState() => _UpdateProdectPageState();
}

class _UpdateProdectPageState extends State<UpdateProdectPage> {
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
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                textfield(
                  onchanged: (data) {
                    ProductName = data;
                  },
                  hinttext: 'Product Name',
                ),
                SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    desc = data;
                  },
                  hinttext: 'Description',
                ),
                SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    price = data;
                  },
                  hinttext: 'Price',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                textfield(
                  onchanged: (data) {
                    image = data;
                  },
                  hinttext: 'Image',
                ),
                SizedBox(
                  height: 70,
                ),
                button(
                  text: 'Updata',
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    await UpdateProdectService(prodect);
                    try {
                      print('success');
                    } catch (e) {
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
