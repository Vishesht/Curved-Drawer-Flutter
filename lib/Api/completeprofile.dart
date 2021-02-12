import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // File _image;
  // final picker = ImagePicker();

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }
  File file = new File("n4.jpeg");

  int _value = 1;
  var currentSelectedValue;
  var gender;
  static const deviceTypes = ["India", "USA", "China"];
  static const genderTypes = ["Male", "Female", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Complete Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height:30,),
          Center(
            child: new CircleAvatar(backgroundImage: new FileImage(file), radius: 100.0,),
          ),
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
                                          hintText: "Enter Email",
                                        ))))),
                        Padding(
                            padding: EdgeInsets.only(left: 25,right: 25),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text("Select Gender"),
                                        value: gender,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            gender = newValue;
                                          });
                                          print(gender);
                                        },
                                        items: genderTypes.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                        SizedBox(height: 10,),

                        Padding(
                            padding: EdgeInsets.only(left: 25,right: 25),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text("Enter Age"),
                                        value: currentSelectedValue,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            currentSelectedValue = newValue;
                                          });
                                          print(currentSelectedValue);
                                        },
                                        items: deviceTypes.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                        SizedBox(height: 10,),
                        Padding(
                            padding: EdgeInsets.only(left: 25,right: 25),
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                              ),
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        hint: Text("Select Your Country"),
                                        value: currentSelectedValue,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            currentSelectedValue = newValue;
                                          });
                                          print(currentSelectedValue);
                                        },
                                        items: deviceTypes.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                        SizedBox(height:20,),
                        Center(
                          child: RaisedButton(
                            onPressed:(){
                              if (_formKey.currentState.validate() ) {
                                if (passwordController.text == confirmpasswordController.text){
                                  //postData();
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
}
