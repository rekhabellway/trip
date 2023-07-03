import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body:  Stack(
          children: [
            Positioned(
              top: 20,
              child: Container(
                height: Get.height/4,
                width: Get.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/waterfall.png",
                        ),
                        fit: BoxFit.cover
                    )
                ),

                child:  Text(""),

              ),
            ),

            Positioned(
              top: 200,
              left: 15,
              right: 15,
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),


                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [

                    ]
                  ),
                  color: Colors.yellow,
                  child: ListTile(
                    title: Row(
                      children: [
                        Text("Category: All"),
                        Icon(Icons.keyboard_arrow_down_outlined)],
                    ),
                  ),
                ),
              ),
            ),

          ],
        )
    );
  }
}
