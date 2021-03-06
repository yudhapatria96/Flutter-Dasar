import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/image_list.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget{
  createState(){
    return AppState();
  }


}



class AppState extends State<App>{
  //add instance variable
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    var response = await get('http://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);

    });



  }

  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,

        ),
      ),

    );
  }

}