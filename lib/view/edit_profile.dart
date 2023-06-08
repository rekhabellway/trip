import 'package:flutter/material.dart';

import 'images.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_outlined, color: Colors.black, size: 30),
                Text("Save", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)
              ],
            ),
          ),
          Center(child: Text("Edit Profile", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          SizedBox(
            height: 10,
          ),
          Center(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(Images.img),
                    fit: BoxFit.fill
                ),
              ),
            ),
          ])),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                            hintText: "Full Name"
               )
            ),
               
                SizedBox(
                  height: 10,
                ),

                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email Address"
                    )
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Mobile Number"
                    )
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Date of Birth"
                    )
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Gender"
                    )
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: "Nationality/ religion"
    )
    ),

                SizedBox(
                  height: 10,
                ),


                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Address"
                    )
                )
    ]
          )
          ) ],
      ),
    );
  }
}
