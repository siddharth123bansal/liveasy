import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liveasy/mobilenum.dart';
import 'package:liveasy/radionum.dart';
import 'package:pinput/pinput.dart';
class Myotpnum extends StatefulWidget {
  const Myotpnum({Key? key}) : super(key: key);
  static String l="";
  @override
  State<Myotpnum> createState() => _MyotpnumState();
  static void getNum(String phone) {
    l=phone;
  }
}
class _MyotpnumState extends State<Myotpnum> {
  final FirebaseAuth auth =FirebaseAuth.instance;
  var l="";
  @override
  Widget build(BuildContext context) {
    var code = "";

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(114, 178, 238, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Mymobilenum()));
          },
              icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black,)
          )
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/numbg.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify Number",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Text(
                'code sent on ' +l, style: TextStyle(
                  color: Colors.grey, fontSize: 14
              ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(onPressed: () {
            },
                child: Text(
                  "Didn't Recieve code? Request Resend", style: TextStyle(
                    color: Colors.grey
                ),)),
            SizedBox(
              width: 216,
            ),
            SizedBox(
              child: Pinput(
                onChanged: (value) {
                  code = value;
                },
                length: 6,
                showCursor: true,
              ),
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 60,
                width: 490,
                child: ElevatedButton(
                    onPressed: () async {
                      //print("phone number is "+'${Mymobilenum.verify}');
                      showDialog(context: context, builder: (context) {
                        return Center(child: CircularProgressIndicator());
                        },
                      );
                      try {
                        PhoneAuthCredential credential = PhoneAuthProvider
                            .credential(verificationId: Mymobilenum.verify, smsCode: code);
                            await auth.signInWithCredential(credential);
                            Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Myradionum()));
                      } catch (e) {
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                            msg: "wrong Otp",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.indigo,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        print("Wrong OTP");
                      }
                    },
                    child: Text("VERIFY", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    )
                ),
              ),
            )
          ], //children
        ),
      ),
    );
  }
}