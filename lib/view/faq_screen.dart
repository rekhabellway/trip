import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

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
        padding: EdgeInsets.all(10),
        children: [
          
          SizedBox(height: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("https://as1.ftcdn.net/v2/jpg/05/35/93/14/1000_F_535931441_VIwNpg32BsnWv8TGnwdTUS9MPmL5uugh.webp",
                height: 80, width: 80,),
              Text("How can we help you?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)


            ],
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor:  Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: "Search",
              prefixIcon:  Icon(Icons.search),
              prefixIconColor: Colors.black,
            ),
          ),
          SizedBox(height: 10,),

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: Get.width/1,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.account_balance),
                    Text("Question about", style: TextStyle(color: Colors.grey[200]),),
                    Text("Getting started", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: Get.width/1,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.account_balance),
                    Text("Question about", style: TextStyle(color: Colors.grey[200]),),
                    Text("Getting started", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Top questions",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              Text("View all",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
            ],
          ),

          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Text("How to create account?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                Text("Open the Kaito app to get started and follow the steps. Kiato doesn’t charge a fee to create or maintain your kaito trading account.",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
