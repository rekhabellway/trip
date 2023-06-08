import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip/view/faq_screen.dart';
import 'package:trip/view/pinput.dart';
import 'package:trip/view/referral_code.dart';

import 'edit_profile.dart';
import 'language.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, ),),
                InkWell( onTap: (){
                  Get.to( () => EditProfile());
                },
                    child: Text("Edit Profile", style: TextStyle(fontSize: 18),))
              ],
            ),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: Size.fromRadius(48), // Image radius
                child: Image.asset('assets/images/discount.png', fit: BoxFit.cover),
              ),
            ),
            title: Text("Harry Marsh", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            subtitle: Text("rjaiswal@gmail.com", style: TextStyle(color: Colors.grey[500]),),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(8),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10)
            ),

            child: ListTile(
              leading: Icon(Icons.card_giftcard, color: Colors.black, size: 30,),
              title: InkWell(
                onTap: (){
                  Get.to( ()=> ReferralCode());
                },
                  child: Text("Referral code", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
              subtitle: Text("Share your friend get Rs.299 of free stocks"),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.add_moderator,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Add fund", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.account_balance,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Deposit & Transfer", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.newspaper,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("News", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            onTap: (){
              Get.to ( () => Language());
            },
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.language,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Language", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Settings", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.lock,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Change Password", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            onTap: (){
              Get.to(()=> FAQScreen());
            },
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("FAQ", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 2,
          ),
          ListTile(
            onTap: (){
              Get.to( () =>  PinputExample ()
              );
    },
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {

                },
              ),
            ),
            title: Text("Logout", style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.chevron_right, size: 30, color: Colors.black,),
          ),
          SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
