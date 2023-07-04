// ignore_for_file: unnecessary_string_escapes, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/register_page.dart';
import '../helper/Show_SnakBar.dart';
import '../widegt/custom_button.dart';
import '../widegt/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage({Key? key});
  static String id = "Login";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  String? email;
  String? password;
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
                const SizedBox(
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
                          fontFamily: 'Algerian'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                const Row(
                  children: [
                    Text(
                      "LOGIN",
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
                        await loginuser();

                        Navigator.pushNamed(context, HomePage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'wrong-password') {
                          ShowSnakBar(
                              context, "The Paswword Provided is Wrong");
                        } else if (e.code == "user-not-found") {
                          ShowSnakBar(context, 'User-Not-Found');
                        }
                      } catch (e) {
                        ShowSnakBar(context, 'Error Occured');
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  text: 'LOGIN',
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don\'t have any account ?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registerpage.id);
                      },
                      child: const Text(
                        "Register",
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

  Future<void> loginuser() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
    // print(user.user!.displayName);
  }
}
