import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Image Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future selectImage() async {
    var image =  await  ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: _image == null ? Text("No image selected") : Image.file(_image),
              ),
              SizedBox(height: 200,),
              FloatingActionButton(
                  onPressed: selectImage,
                  tooltip: 'PickImage',
                  child: Icon(Icons.add_a_photo),
                  )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
