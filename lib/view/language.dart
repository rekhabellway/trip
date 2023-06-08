import 'package:flutter/material.dart';

import 'model/language_model.dart';

class Language extends StatefulWidget {
   Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  // int selectedItem = 0;
  final List<LanguageModel> languages = [

    LanguageModel(
      id: 1,
      image: "https://freepngimg.com/thumb/china/158840-flag-china-free-hd-image.png",
      name: "Chinese",
    ),
    LanguageModel(
      id: 2,
      image: "https://pngimg.com/uploads/spain/spain_PNG66.png",
      name: "Spanish",
    ),
    LanguageModel(
      id: 3,
      image: "https://www.pngkit.com/png/full/102-1028757_free-france-flag-icon-france-round-flag-png.png",
      name: "French",
    ),
    LanguageModel(
      id: 4,
      image: "https://freepngimg.com/thumb/vietnam/8-2-vietnam-flag-free-download-png.png",
      name: "Vietnamese",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title:   Text("Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        ),
        body: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:  Color(0xfff1f1f1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                             ),
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black,
                        ),
                      ),
                    ),
                ListView.builder(
                  shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  LanguageModel model = languages[index];
                  return  Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey,
                              blurRadius: 1)],
                    ),
                    child: ListTile(
                      leading:
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.network(model.image!,
                            width: 60,
                            height: 60,),
                        ),
                      ),
                      title: Text(model.name!),
                      trailing: Icon(Icons.chevron_right,
                          size: 30, color: Colors.black),
                    ),
                  );
                },
                itemCount: languages.length,
              ),
           ]   )
    )
    ])
    );
  }
}
