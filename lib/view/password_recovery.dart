import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_recover_email.dart';

class PasswordRecoveryPhoneNum extends StatelessWidget {
  const PasswordRecoveryPhoneNum({Key? key}) : super(key: key);

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
        children:[
          Container(
            margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(10),
         child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text("Password recovery",  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Enter your phone number to recover your password"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phone number", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text("Email",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Text("+91", style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Get.to( ()=> PasswordRecoveryEmail());
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(30),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Text("SendOTPCode", style: TextStyle(fontSize: 20,  fontWeight: FontWeight.bold),)),
                    ),
                  ),
 ]   ),
                 
          
        ),
     ] )
    );
  }
}
