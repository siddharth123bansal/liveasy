import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/language.dart';
import 'package:liveasy/mobilenum.dart';
import 'package:liveasy/otpnum.dart';
import 'package:liveasy/radionum.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: "language",
    debugShowCheckedModeBanner: false,
    routes: {
      "language":(context)=>Mylanguage(),"mobilenum":(context)=>Mymobilenum(),"otpnum":(context)=>Myotpnum(),"radionum":(context)=>Myradionum(),

    },
  ));
}