import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Verification", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5
                ),
                Text("Enter 4- digit code we just texted to your phone \n number, +91 999 999 9999",style: TextStyle(fontSize: 17,), ),
                SizedBox(height: 20,),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                        length: 4,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)
                        ),
                        child: Center(child: Text("Continue", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                        child: Center(child: Text("Resend Code", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
                      ),

                    ],
                  ),
                ),


         ]   ),
          )
        ],
      ),
    );
  }
}
