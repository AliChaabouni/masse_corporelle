import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Masse_Corporelle_resultat extends StatelessWidget
{
  final bool isMale;
  final double result;
  final int age;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;



  Masse_Corporelle_resultat({required this.result, required this.age, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 15, 30, 1.0),

        centerTitle: true,
        title: Text("Indice de masse corporelle ",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 40),),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Genre: ${isMale? 'Male':'Female'}",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(

              "Resultat: ${result.round()}",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Age: $age",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        ),
      ),
    );
  }

}
