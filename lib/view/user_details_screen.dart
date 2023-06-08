import 'package:flutter/material.dart';
import 'model/response.dart';
import 'model/user model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }
  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: _userModel == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_userModel![index].id!=null?"Id : "+_userModel![index].id.toString():"",style: TextStyle(color: Colors.black),),
                  SizedBox(height: 10,),
                  Text(_userModel![index].title!=null?"title : "+_userModel![index].title!:
                  "title:", style: TextStyle(color: Colors.green),),
                  SizedBox(height: 10,),
                  Text(_userModel![index].userId!=null?"useId : "+_userModel![index].userId.toString():""),
                  SizedBox(height: 10,),
                  Text(_userModel![index].body!=null?"body : "+_userModel![index].body!:"")  ],
              ),
            ),
          );
        },
      ),
    );
  }
}
