import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 176, 7),
                      Color.fromARGB(255, 250, 147, 52)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 44, 44, 44).withOpacity(0.2),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                ),
              Row(
                children:  [
                 ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/aymen.jpg',height: 75,width: 75,),
                
                
                
                ),
                 Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Aymen Jnayah',
                    style: TextStyle(color: Color.fromARGB(255, 52, 49, 49),fontWeight: FontWeight.w500),
                    ),
                    
                  ],
                ),
               
                Column(
                  children: <Widget>[
                  Icon(Icons.water_drop,
                  color: Colors.white,
                  size: 30,),
                  ],
                ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
