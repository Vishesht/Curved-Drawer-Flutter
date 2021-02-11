import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Dialogboxs extends StatefulWidget {
  @override
  _DialogboxsState createState() => _DialogboxsState();
}

class _DialogboxsState extends State<Dialogboxs> {
  String _time = "Not set";
  StateSetter _setState;

  @override
  void initState() {
    super.initState();
    //_time = '${time.hour} : ${time.minute} : ${time.second}';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Date Dialogbox"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              return showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  title: Text("Alert Dialog Box"),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter dialogSetState){

                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Time = $_time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                            FlatButton(
                              onPressed: () {
                                DatePicker.showTimePicker(context,
                                    theme: DatePickerTheme(
                                      containerHeight: 210.0,
                                    ),
                                    showTitleActions: true, onConfirm: (time) {
                                      dialogSetState((){
                                        _time = '${time.hour} : ${time.minute} : ${time.second}';
                                      });

                                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                              },
                              child: Text("Set timing"),
                            ),
                            FlatButton(
                              onPressed: () {
                                //Navigator.of(context).pop();
                                Navigator.pop(context, true);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Set time',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                SizedBox(width: 30,),
                Text("$_time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              ],
            )
          ),
        ),
      ),
    );
  }
}