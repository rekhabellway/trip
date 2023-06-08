import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:trip/view/password_recovery.dart';

class PinputExample extends StatelessWidget {
  const PinputExample({Key? key}) : super(key: key);

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
       children :[
         Center(
           child: Image.network("https://as1.ftcdn.net/v2/jpg/05/35/93/14/1000_F_535931441_VIwNpg32BsnWv8TGnwdTUS9MPmL5uugh.webp",
             height: 80, width: 80,),
         ),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text("Setup pin", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
               Text("Enter your pin number", )
             ],
           ),
         ),
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
              SizedBox(height: 20,),
             InkWell(
               onTap: (){
                 Get.to( () => PasswordRecoveryPhoneNum());
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 margin: EdgeInsets.all(30),
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.green
                 ),
                 child: Center(
                     child: Text("Continue", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)),
               ),
             )
            ],
          ),
        ),
    ] ),
    );
  }
}