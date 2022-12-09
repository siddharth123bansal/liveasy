import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mydashboard extends StatefulWidget {
  const Mydashboard({Key? key}) : super(key: key);

  @override
  State<Mydashboard> createState() => _MydashboardState();
}

class _MydashboardState extends State<Mydashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Container(
       alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 320,
              child: Container(
                margin: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color:Colors.black),
                ),
                child: Text("Dashboard",style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,color: Colors.indigo
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