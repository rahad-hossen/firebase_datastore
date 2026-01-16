import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Manage/DataCalling.dart';
import 'package:provider/provider.dart';

class addData extends StatelessWidget{

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hint: Text("Your Name.."),
                  label: Text("Name")
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hint: Text("Your Email.."),
                    label: Text("Email")
                ),
              ),
              SizedBox(height: 10,)
              ,
              OutlinedButton(
                  onPressed: () async {
                    bool isOk = await (context).read<allData>().addData(name: name.text.toString(), email: email.text.toString());
                    if(isOk){ Navigator.pop(context);}
                  },
                  child: Text("Insert in Database")
              )
            ],
          ),
        ),
      ),
    );

  }

}