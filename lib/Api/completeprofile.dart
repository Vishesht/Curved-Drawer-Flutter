import 'dart:convert';
import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfile extends StatefulWidget {
  String myToken;
  CompleteProfile({this.myToken});
  //CompleteProfile({Key key, @required this.myToken}) : super(key: key);
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  TextEditingController emailController = new TextEditingController();

  // TextEditingController genderController = new TextEditingController();
  // TextEditingController passwordController = new TextEditingController();
  // TextEditingController confirmpasswordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var country;
  var gender;
  var age;
  static const deviceTypes = ["India", "USA", "China"];
  static const genderTypes = ["Male", "Female", "Others"];
  static const ageTypes = ["1", "2", "3","4", "5", "6"];

  var myImage = "";

@override
  void initState() {
    super.initState();
    print("-----myToken"+widget.myToken.toString());

  }

  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;



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
          CircleAvatar(backgroundImage: myImage == null ?  AssetImage('n1.jpg') : NetworkImage("https://staging.promaticstechnologies.com/Beauffer/public/images/users/"+myImage) ,
            backgroundColor: Colors.grey,radius: 90,child: _imageFile == null ? Text("Upload Image",
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),) : null),
          GestureDetector(
            onTap: () async {
              final pickedFile = await _picker.getImage(source: ImageSource.gallery);
              setState(() {
                _imageFile = pickedFile;
                print("pathhhh - "+_imageFile.path);
                print("image is here - "+myImage);

              });
            },
              child: Container(margin: EdgeInsets.only(left: 100,bottom: 0),child: Icon(Icons.camera_alt_outlined))),
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
                                        controller: emailController,
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
                                          //print("my Dataadata -  "+ myToken);
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
                                        value: age,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            age = newValue;
                                          });
                                          print(age);
                                        },
                                        items: ageTypes.map((String value) {
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
                                        value: country,
                                        isDense: true,
                                        onChanged: (newValue) {
                                          setState(() {
                                            country = newValue;
                                          });
                                          print(country);
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
                                postData();
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
  void postData() async {
    Map<String , String > map ={'email': emailController.text,
      'gender': gender,
      'age': age,
      'country':country,
    };
    //print("bwefhbguefv "+myToken);
    //final String myToken = '267e6a9d5a128fb1f44e670fcd89793af50fa9a831e6ae7dc2f0592b508bd224a71290fbdf1619cf52ed0f2c034b26380a061afcba59125c7061359d2963e2f5a906bb2967c9ed34edc4e71a0b837ec47a013f7e16790b7820418dc5a4c23e16c6d9e17e6f945661389dbf8fdc0160255fe7e809be0ce0110492eb63d5423a8fa3f561b507209786a303acb6ab2cf816cf76bad00d77121babf0d9b95b8bd7f434e0002c3aea0b6265fd8acf9b44fc1b';
    var url = 'https://staging.promaticstechnologies.com:3001/user_complete_profile';
    var req = http.MultipartRequest('POST', Uri.parse(url));
    req.headers.addAll({HttpHeaders.authorizationHeader: widget.myToken });
    req.fields.addAll(map);

    req.files.add(await http.MultipartFile.fromPath('profile_image', _imageFile.path));
   // var response = await http.post(url, body: {'email': emailController.text, 'gender': gender,'age': age,'country':country,'profile_image': _imageFile.readAsBytes()},headers: {HttpHeaders.authorizationHeader: widget.myToken });
   //  print('Response status: ${response.statusCode}');
   //  print('Response body: ${response.body}');
    req.send().then((response) async {
      if (response.statusCode == 200){
        print("Inside 200");
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);


        Map dataIs = jsonDecode(responseString);
        var imageName = dataIs['response']['profile_image'];
        print("image is the gsgdyd"+imageName);
        setState(() {
          myImage=imageName;
        });
        print("Response is "+responseString.toString());

      } else if(response.statusCode == 201){
        print("Inside 201");
      }else{
        print("Error !");
      }
    });
  }
}
