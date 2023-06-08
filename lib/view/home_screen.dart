import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:trip/view/profile_screen.dart';
import 'package:trip/view/user_details_screen.dart';

import 'images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
              child: ListView(
                      children: [
                      Container(
                           margin: const EdgeInsets.all(10),
                           padding: const EdgeInsets.all(10),
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.blue
                           ),
                             child: Column(
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  const Icon(Icons.person, color: Colors.white,), Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Rekha Jaiswal", style: TextStyle(color: Colors.white, fontSize: 18),),
                Text("9399819186",style: TextStyle(color: Colors.white),)
              ],
            ),
                                  const Icon(Icons.chevron_right, color: Colors.white,)
          ],
        )
      ],
    ),
  ),
  Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: const [
            Icon(Icons.person_add_alt, color: Colors.black,),
            Text("MyAccount")
          ],
        ),
        Column(
          children: const [
            Icon(Icons.message_outlined, color: Colors.black,),
            Text("Support")
          ],
        ),
        Column(
          children: const [
            Icon(Icons.notifications_active_outlined, color: Colors.black,),
            Text("Notifications")
          ],
        ),


      ],
    ),
  ),
  Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("My Trips", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ListTile(
  leading:Icon(Icons.shopping_bag_sharp,),
  title: Text("ViewManage Trips", style: TextStyle(fontWeight: FontWeight.bold),),
  trailing: Icon(Icons.chevron_right, color: Colors.blue,),

),
        ListTile(
          leading:Icon(Icons.favorite_border_outlined,),
          title: Text("Wishlist", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        )
      ],
    ),
  ),
  Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ListTile(
          leading:Icon(Icons.h_mobiledata,),
          title: Text("Coupon Lourge", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        ),

      ],
    ),
  ),
  Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Rewards", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ListTile(
          leading:Icon(Icons.card_giftcard_outlined,),
          title: Text("Gift Cards", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        ),
        ListTile(
          leading:Icon(Icons.gif_box,),
          title: Text("Rewards", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        ),
        ListTile(
          leading:Icon(Icons.earbuds_outlined,),
          title: Text("Refer & Earn", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        )
      ],
    ),
  ),
  Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Settings", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),

        ListTile(
          leading:Icon(Icons.language_outlined,),
          title: Text("Language", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        ),
        ListTile(
          leading:Icon(Icons.flag,),
          title: Text("Country", style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: Icon(Icons.chevron_right, color: Colors.blue,),

        )
      ],
    ),
  ),
                        Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/img_2.png", fit: BoxFit.cover,),
                    ),
                    const Center(
                      child: Text("Privacy Policy", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                   ),
                    const SizedBox(
                    height: 10,
                    ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Center(
                      child: Text("App Version 8.9.7", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
    ),
        )
],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Icon(
          Icons.flight,
          color: Colors.red, size: 20,),
          actions: <Widget>[
            IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              Get.to( ()=> UserDetailsScreen());
            },
          ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              tooltip: 'calender',
              onPressed: () {
                Get.to( () => ProfileScreen());
              },
            ),
          ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.car_rental, color: Colors.blue,),
                        Text("Airport Cabs"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.hotel, color: Colors.red,),
                        Text("Hotels"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.car_repair, color: Colors.orange,),
                        Text("Outstation Cabs"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.car_rental, color: Colors.green,),
                        Text("Travel Insurance"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.car_rental, color: Colors.blue,),
                        Text("Airport Cabs"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.hotel, color: Colors.red,),
                        Text("Hotels"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.car_repair, color: Colors.orange,),
                        Text("Outstation Cabs"),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.car_rental, color: Colors.green,),
                        Text("Travel Insurance"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.train),
                      Text("Trains")
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(Icons.percent_rounded, color: Colors.purple,),
              SizedBox(width: 8,),
              Text("OFFERS", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return  Container(
                  margin:  EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Image.asset("assets/images/travel.png",
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("EXCLUSIVE PARTNERS", style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return  Container(
                  margin: const EdgeInsets.all(3),
                  child: Column(
                    children: [
                      Image.asset(Images.discount,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            children: const [
              Icon(Icons.new_releases, color: Colors.red,),
              SizedBox(width: 5,),
              Text("WHAT'S NEW",
                style: TextStyle(color: Colors.red,
                    fontWeight: FontWeight.bold, fontSize: 20),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Announced")
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Travel News")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return  Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.streetview, size: 20, color: Colors.blue,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Dream Trips Made Easy!"),
                              Text("Offers", style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                          const Icon(Icons.chevron_right, color: Colors.blue,)
                        ],
                      )
                    ],
                  ),
                );
              },

            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
          leading : const Icon(Icons.local_offer, color: Colors.blue,),
            title: const Text("WHERE2GO", style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold
            ),),
            trailing: SizedBox(
              width: 80,
              child: Row(
                    children: const [
                    Text("View All",
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,
                  fontSize: 15),),Icon(Icons.chevron_right, color: Colors.blue,),
                      ],
                  ),
            )
          ),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Stories By Travellers",
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),

          StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Image.asset(Images.trip, fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          children: const [
                        Text("Bananas", style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),),
                        Text("Bananas", style: TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                        Text("Bananas", style: TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),)
                          ],
                        )
                      ],
                    )
                  ],
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
              }),
        ],
      ),
    );
  }
}
