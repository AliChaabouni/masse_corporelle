import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projetflutter/login/login.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);
  static const String id = 'assignment';

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Singup> {

  final FirebaseFirestore firestore =FirebaseFirestore.instance;
  final TextEditingController fullna =TextEditingController();
  final TextEditingController email =TextEditingController();
  final TextEditingController phone =TextEditingController();
  final TextEditingController password =TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff424242),
                  Color(0xff5c5c5c),
                  Color(0xff7d7d7d),
                ]
            )
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/iit.png',
              width: 150,
              height: 100,
            ),
            /// Sign up & Welcome
            Container(
                padding: const EdgeInsets.only(top:30, bottom: 30, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Text('Indice de masse corporelle', style: TextStyle(color:Colors.white.withOpacity(0.8), fontSize: 40),),
                  ],
                )
            ),
            /// The rest
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(top: 80, right: 15, left: 15),
                child: Column(
                  children: [


                    /// Text Fields
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 20,
                                spreadRadius: 5,
                                offset: const Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children:  [
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Fullname',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            controller: fullna,
                          ),
                          Divider(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            controller: email,
                          ),
                          Divider(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Phone',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            controller: phone,
                          ),
                          Divider(height: 10,),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            controller: password,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    /// Sign Up
                    MaterialButton  (
                      shape: const StadiumBorder(),
                      minWidth: 230,
                      height: 45,
                      color: const Color(0xff616161),
                      child: const Text("S'inscrit", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),textAlign: TextAlign.center,),
                      onPressed: () async {
                        await register(email.text, password.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Login()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Login()),
                        );
                      },
                      child: Text("Login",style:TextStyle(fontWeight:FontWeight.bold,fontSize:17,color: Colors.grey[800]),),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
   register(String  email, password) async {
    try {
     FirebaseAuth auth =FirebaseAuth.instance;
     await auth.
          createUserWithEmailAndPassword(email: email, password: password);

    } catch (firebaseAuthException) {
      print(firebaseAuthException.toString());
    }
  }
}