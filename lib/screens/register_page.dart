import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/screens/home_page.dart';
import '../helper/Show_SnakBar.dart';

import '../widegt/custom_button.dart';
import '../widegt/custom_textfield.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);
  static String id = "Register";

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/photo-1634973357973-f2ed2657db3c.jpeg',
                  height: 175,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Store App",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontFamily: 'Pacifico'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                const Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                textfield(
                  onchanged: (data) {
                    email = data;
                  },
                  hinttext: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                textfield(
                  obscureText: true,
                  onchanged: (data) {
                    password = data;
                  },
                  hinttext: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                button(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await registeruser();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, HomePage.id,
                            arguments: email);
                        //ShowSnakBar(context, 'The Register is Success ');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ShowSnakBar(
                              context, "the Paswword Provided is Too Weak");
                        } else if (e.code == "email-already-in-use") {
                          ShowSnakBar(
                              context, 'the Account Already Exists For users');
                        }
                      } catch (e) {
                        ShowSnakBar(context, 'Error Occured');
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  text: 'REGISTER',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "have already account ?  ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registeruser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    // print(user.user!.displayName);
  }
}
