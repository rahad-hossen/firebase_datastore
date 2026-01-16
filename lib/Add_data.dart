import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Manage/DataCalling.dart';
import 'package:flutter_learn/main.dart';
import 'package:provider/provider.dart';

class addData extends StatelessWidget{

  static TextEditingController name = TextEditingController();
  static TextEditingController email = TextEditingController();

  static bool isUpdate = false;
  static String id = "";
  // bool isUpdate;
  // String id, name_, email_;
  // addData(this.isUpdate,this.id,this.name,this.email);
  // addData({required String name});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: isUpdate ? Text("Update Details"):Text("Add Detalis"),
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
                  hint: isUpdate ? Text("Update Name.."): Text("Your Name.."),
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
                    hint: isUpdate ? Text("Update Email.."):Text("Your Email.."),
                    label: Text("Email")
                ),
              ),
              SizedBox(height: 10,)
              ,
              OutlinedButton(
                  onPressed: () async {

                    if (isUpdate){
                      bool isOk = await (context).read<allData>().UpdateData(id: id, name: name.text.toString(), email: email.text.toString());
                      if (isOk){Navigator.pop(context);}
                    }else{
                      bool isOk = await (context).read<allData>().addData(name: name.text.toString(), email: email.text.toString());
                      if(isOk){ Navigator.pop(context);}
                    }

                  },
                  child: isUpdate ? Text("Update Detalis"):Text("Insert Details")
              )
            ],
          ),
        ),
      ),
    );

  }

}