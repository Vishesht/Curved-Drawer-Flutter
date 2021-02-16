import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'completeprofile.dart';



class RegisterApi extends StatefulWidget {

  @override
  _RegisterApiState createState() => _RegisterApiState();
}

class _RegisterApiState extends State<RegisterApi> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image(image: AssetImage('log.png'),),
          SizedBox(height:30,),
          Center(child: Text('Sign Up',style: TextStyle(color: Colors.pink,fontSize: 28),),),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                                  child: TextFormField(
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                    controller: nameController,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Enter Full Name",
                                      ))))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: TextFormField(
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                    controller: phoneController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Enter Mobile Number",
                                      ))))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: TextFormField(
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                    controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Enter Your Password",
                                      ))))),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  child: TextFormField(
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return 'Text is empty';
                                        }
                                        return null;
                                      },
                                      controller: confirmpasswordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Confirm Your Password",
                                      ))))),
                      SizedBox(height:20,),
                      Center(
                        child: RaisedButton(
                          onPressed:(){
                            if (_formKey.currentState.validate() ) {
                              if (passwordController.text == confirmpasswordController.text){
                                postData();
                              }else{
                                print('password not match');
                              }
                            }
                          },
                          color: Colors.pinkAccent,
                          disabledColor: Colors.pinkAccent,
                          padding: const EdgeInsets.only(left: 150,right: 150,top: 15,bottom: 15),
                          child: new Text(
                            "Submit",
                              style: TextStyle(color: Colors.white)
                          ),
                        ),
                      ),
                      SizedBox(height:30,),
                      Center(
                        child: Text("Already have an account?",style: TextStyle(fontSize: 20,color: Colors.pinkAccent),),
                      )
                    ],
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }

  void postData() async {
    var url = 'https://staging.promaticstechnologies.com:3001/user_register';
    var response = await http.post(url, body: {'fullname': nameController.text, 'contact_number': phoneController.text,'password': passwordController.text});
    print('Response status: ${response.statusCode}');
    var data = jsonDecode(response.body);
    var myToken = data['data']['token'];
    print("wwwyyDataadata"+myToken.toString());
    //print("fcccDataadata"+data.toString());
    print('Response body: ${response.body}');
    Navigator.push(context, MaterialPageRoute(builder: (context)=> CompleteProfile(myToken:myToken.toString())));
  }
}

