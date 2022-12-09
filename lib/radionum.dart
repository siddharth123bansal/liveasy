import 'package:flutter/material.dart';
class Myradionum extends StatefulWidget {
  const Myradionum({Key? key}) : super(key: key);

  @override
  State<Myradionum> createState() => _MyradionumState();
}

class _MyradionumState extends State<Myradionum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background:Image.asset('assets/images/bck_bg.png') ,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[

            ],//children
          ),
        ),
      ),
    );
  }
  Widget customRadio(){
    return OutlinedButton(
      onPressed: (){},
        child:Text(""),
       // child:RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.0))

      //child: Text(""),

    );
  }
}
