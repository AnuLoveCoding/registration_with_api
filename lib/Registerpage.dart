import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  var name=TextEditingController();
  var email=TextEditingController();
  var mobile=TextEditingController();
  var add=TextEditingController();
  var pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Register From'),),
    
    
    body: Column(
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(
          hintText: 'Name'
        ),),

        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'email'
        ),),
        TextField(
          controller: mobile,
          decoration: InputDecoration(
            hintText: 'mobile'
        ),),
        TextField(
          controller: add,
          decoration: InputDecoration(
            hintText: 'address'
        ),),
        TextField(
           controller: pass,
           decoration: InputDecoration(
            hintText: 'Password'
        ),),

        ElevatedButton(onPressed: (){

          HipApiDemo(name.text,email.text,mobile.text,add.text,pass.text);

        }, child: Text('Register'))
      ],
    )




    
    
    
    
    );
  }

  void HipApiDemo(name,email,mobile,add,pass) async {
    final response = await http.get(Uri.parse('http://www.digitechy.in.net/Webservice1.asmx/RegisterApi?nn='+name+'&ee='+email+'&mm='+mobile+'&aa='+add+'&pp='+pass));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      print(response.body);
      // print("Status OK");
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }
}