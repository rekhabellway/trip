import 'package:flutter/material.dart';

class ReferralCode extends StatelessWidget {
  const ReferralCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children: [
         Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30),
              Center(
                  child: Text("Referral Code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
              SizedBox(
                height: 25,
              ),
            Center(child: Image.asset("assets/images/referral&earn.png", height: 200, width: 250,)),
              SizedBox(
                height: 15,
              ),
              Center(child: Text("Refer & Earn", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
              Center(child: Column(
                children: [
                  Text("share this code with your friend and both"),
                  Text("of you will get Rs.10 free stocks.")
                ],
              )),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 border: Border.all(
                     color: Colors.black,
                 )
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TradeKaito", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    Icon(Icons.copy, size: 30, color: Colors.black,)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightGreen,
                    border: Border.all()
                ),
                child:
                Center(
                  child: Text("Refer Friend", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold
                  ),),
                ),
              )
            ],
          ),
        ),
     ] )
    );
  }
}
