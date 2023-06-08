import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
      children: [
        Container(
          height: Get.height/3,
          width: Get.width,
          decoration: const BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/images/waterfall.png",
             ),
             fit: BoxFit.cover
           )
          ),

          child:   Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  const [
                  Text("Upto 25% OFF on your first\nbooking as a Welcome Gift!",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                ],
              ),
            ),
          ),

        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              height: Get.height/2,
              decoration:  BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text("Use Mobile Number or Email to Login/Signup",
                    style: TextStyle(color: Colors.grey),),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),

                    width: double.infinity,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey
                    ),
                    child:  Center(
                      child: InkWell(
                        onTap: (){
                          Get.to( () => const HomeScreen());
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("or Login/Signup with", style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(10),
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/google.png",
                            height: 20, width: 20,),
                          const SizedBox(width: 10,),
                          const Text("Sign in with Google")
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Have a "),
                      Text("Referral Code?",
                        style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.bold),)
                    ],),
                  const Center(
                      child: Text("Privacy Policy",style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),))
                ],
              ),
            ),
          ],
        ),
      ],
        ),
    );
  }
}
