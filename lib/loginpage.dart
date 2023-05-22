import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Registerpage.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

    final  email = TextEditingController();
    final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),

      body: Column(
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
              hintText: "Enter Your Email"
            ),
          ),
          TextField(
            controller: password,
            decoration: InputDecoration(
              hintText: "Enter Your Password"
            ),
          ),
          ElevatedButton(onPressed: (){
            Hitlogin(email.text,password.text);
           }, child: Text('Login Here')),
          SizedBox(height: 15.0,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return RegisterPage() ;
            }));
           }, child: Text("Registration for new User"))
        ],
      ),
    );
  }

  void Hitlogin(email, password) async {
    final response = await http.get(Uri.parse('http://www.digitechy.in.net/Webservice1.asmx/LoginApi?ee='+email+'&pp='+password));
    if(response.statusCode == 200){
      print(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Sucessfully")));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CircularProgressIndicator()));
      throw Exception('Login Failed');
    }
  }
}
