import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy/language.dart';
import 'package:liveasy/otpnum.dart';

class Mymobilenum extends StatefulWidget {
  const Mymobilenum({Key? key}) : super(key: key);

  static String verify="";
  static var pno="";

  @override
  State<Mymobilenum> createState() => _State();
}

class _State extends State<Mymobilenum> {
  var phone="";
  TextEditingController numController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> const Mylanguage())); },
              icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)
          )
      ),
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/numbg.png'),
            fit:BoxFit.cover
            ),
          ),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              Text("Please Enter Your Mobile Number",
                style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child:Text("you'll recieve a 6 digit code to verify next",style: TextStyle(
                    color: Colors.grey,fontSize: 14
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 216,
              ),
              SizedBox(height: 25),

              Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color:Colors.black),
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 60,
                        child: Image.asset('assets/images/india.png'),
                      ),
                      SizedBox(width: 1,),
                      SizedBox(
                        width: 27,
                        child: Text('+91'),
                      ),
                      SizedBox(width: 3,),
                      SizedBox(
                        width: 10,
                        child: Text('-'),
                      ),
                      Expanded(
                        child: TextField(
                          controller: numController,
                          keyboardType: TextInputType.number,
                          onChanged: (value){phone=value;},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mobile Number",
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 25,),
             Container(
               margin: EdgeInsets.only(left: 16,right: 16),
              child: SizedBox(
                 height: 60,
                 width: 490,
                 child: ElevatedButton(
                     onPressed:()async{
                       showDialog(context: context, builder: (context){
                         return Center(child: CircularProgressIndicator());
                       },
                       );

                       if(phone.length>10){
                         Navigator.of(context).pop();
                         Fluttertoast.showToast(
                             msg: "Enter a valid number",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.BOTTOM,
                             timeInSecForIosWeb: 3,
                             backgroundColor: Colors.indigo,
                             textColor: Colors.white,
                             fontSize: 16.0
                         );
                       }else if(phone.length<10){
                         Navigator.of(context).pop();
                           Fluttertoast.showToast(
                               msg: "Enter a valid number",
                               toastLength: Toast.LENGTH_SHORT,
                               gravity: ToastGravity.BOTTOM,
                               timeInSecForIosWeb: 3,
                               backgroundColor: Colors.indigo,
                               textColor: Colors.white,
                               fontSize: 16.0
                           );
                       }else if(phone.isEmpty){
                         Navigator.of(context).pop();
                         Fluttertoast.showToast(
                             msg: "Enter a valid number",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.BOTTOM,
                             timeInSecForIosWeb: 3,
                             backgroundColor: Colors.indigo,
                             textColor: Colors.white,
                             fontSize: 16.0
                         );
                       }
                       else{
                         Myotpnum.getNum(phone);
                         await FirebaseAuth.instance.verifyPhoneNumber(
                           phoneNumber:'+91'+phone,
                           verificationCompleted: (PhoneAuthCredential credential) {Navigator.of(context).pop();
                             },
                           verificationFailed: (FirebaseAuthException e) {
                             Fluttertoast.showToast(
                                 msg: "Wrong number",
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.BOTTOM,
                                 timeInSecForIosWeb: 1,
                                 backgroundColor: Colors.indigo,
                                 textColor: Colors.white,
                                 fontSize: 16.0
                             );
                             Navigator.of(context).pop();
                           },
                           codeSent: (String verificationId, int? resendToken) {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Myotpnum(),));
                             Mymobilenum.verify=verificationId;
                           },
                           codeAutoRetrievalTimeout: (String verificationId) {},
                         );
                       }
                     },
                     child: Text("CONTINUE",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                     style: ElevatedButton.styleFrom(
                       primary: Colors.indigo,
                     )
                 ),
               ),
             )
            ],//children
          ),
        ),
    );
  }
}