import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/Masse_Corporelle/masse_corporelle.dart';
import 'package:projetflutter/login/singup.dart';

import '../fire_auth.dart';

class Login extends StatefulWidget {

  static const String id = 'mentor sample 1';



  @override
  _Sample1State createState() => _Sample1State();
}

class _Sample1State extends State<Login> {

  final FirebaseFirestore firestore =FirebaseFirestore.instance;
  final TextEditingController email =TextEditingController();
  final TextEditingController password =TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color(0xff424242),
                  Color(0xff5c5c5c),
                  Color(0xff7d7d7d),
                ]
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(

              'assets/images/iit.png',
              width: 150,
              height: 100,
            ),
            const SizedBox(height: 30),

            // #login
            Padding(

              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Indice de masse corporelle ",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 40),),

                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 60,),
                          // #email, #password
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const[
                                BoxShadow(
                                    color: Color.fromRGBO(171, 171, 171, .7),blurRadius: 20,offset: Offset(0,10)),
                              ],
                            ),


                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child:  TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: email,
                                  ),
                                ),
                                Container(
                                  padding:  EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                                  ),
                                  child:  TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                    controller: password,
                                  ),

                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          // #login
                          MaterialButton  (
                            shape: const StadiumBorder(),
                            minWidth: 230,
                            height: 45,
                            color: const Color(0xff616161),
                            child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),textAlign: TextAlign.center,),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                User? user =
                                await FireAuth.signInUsingEmailPassword(
                                  email: email.text,
                                  password: password.text,
                                );

                                print(user);

                                if(user!=null){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Masse_Corporelle()),
                                  );
                                }
                              }

                            },
                          ),
                          const SizedBox(height: 30),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Singup()),
                              );
                            },
                            child: Text("S'inscrire",style:TextStyle(fontWeight:FontWeight.bold,fontSize:17,color: Colors.grey[800]),),
                          ),
                          const SizedBox(height: 30),

                        ],

                      ),
                    ),

                  ),

                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


