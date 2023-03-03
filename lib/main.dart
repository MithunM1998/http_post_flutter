import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_post.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  Future<Post?> submitData(String title,String body) async
  {
  var response= await http.post(Uri.https('jsonplaceholder.typicode.com','posts'),body:{
    "title": title, "body": body});
  var data=response.body;
print(data);
  if(response.statusCode==201){
    String responseString=response.body;
    PostFromJson(responseString);

  }else
    return null;
  }

class _MyHomePageState extends State<MyHomePage> {
  Post? _post;
  TextEditingController nameeditingcontroller=TextEditingController();
  TextEditingController jobeditingconroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Http post method"),),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller:nameeditingcontroller,decoration: InputDecoration(hintText:'Enter name here' ,border: OutlineInputBorder()),),
              SizedBox(height: 15.0,),
              TextField(controller:jobeditingconroller,decoration: InputDecoration(hintText:'Enter Jobtitle  here' ,border: OutlineInputBorder()),),

              ElevatedButton(onPressed: ()async{
              String title=nameeditingcontroller.text;
              String body=jobeditingconroller.text;

              Post? post=await submitData(title, body);

              setState(() {
                _post=post;
              });
              }, child: Text("submit"))

            ],
          ),
        ),
      )
    );
  }
}

