import 'package:flutter/material.dart';
import 'package:liveasy/dashboard.dart';
import 'package:liveasy/mobilenum.dart';
class Mylanguage extends StatefulWidget {
  const Mylanguage({Key?key}):super(key:key);
  @override
  State<StatefulWidget> createState()=> _MylanguageState();
}
class _MylanguageState extends State<Mylanguage>  {
 var lan=['English','Hindi'];
 String _currentItemSelected='English';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //background:Image.asset('assets/images/bck_bg.png') ,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(

             image: AssetImage('assets/images/b.png'),
              fit:BoxFit.cover
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              SizedBox(
                height: 45,
                child: Image.asset(
                  'assets/images/bg.png',
                ),
              ),
              SizedBox(height: 25,),
              Text("Please select a language",
                  style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child:Text("you can change the language at any time,",style: TextStyle(
                    color: Colors.grey,fontSize: 14
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10,),
             Container(
               decoration: BoxDecoration(
                 border: Border.all(width: 1,color:Colors.black),
               ),
             child:SizedBox(
               width: 216,
               height: 45,
               child:DropdownButton<String>
                 (
                 icon: Icon(Icons.arrow_drop_down),
                 iconSize: 36,isExpanded: true,underline: Container(),
                 items: lan.map((String dropDownStringitem){
                   return DropdownMenuItem<String>(
                     value: dropDownStringitem,
                     child: Text(" "+dropDownStringitem),
                   );
                 }).toList(),
                 onChanged: (newValueSelected)async{
                   setState(() {
                     String x=newValueSelected!;
                     this._currentItemSelected=x;
                   });
                 },
                 value: _currentItemSelected,
               ),
              ),
             ),
              SizedBox(height: 25),
              SizedBox(
                height: 55,
                width: 216,
              child: ElevatedButton(
                onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Mymobilenum()));
                },
                child: Text("NEXT",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                    )
              ),
              ),
            ],//children
          ),
        ),
      ),
    );
  }
}