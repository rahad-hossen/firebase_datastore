import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class allData extends ChangeNotifier{

  final dbReferance = FirebaseFirestore.instance.collection('users');

  List<Map<String,dynamic>> _data = [];
  List<Map<String,dynamic>> get data => _data;

  Future<void> loadData() async {
    final allData = await dbReferance.get();
    _data.clear();
    for (var dataUser in allData.docs){
      _data.add(dataUser.data());
    }

    notifyListeners();
  }

  Future<bool> addData({required String name, required String email}) async {

    var unicCode = DateTime.now().microsecondsSinceEpoch;

    await dbReferance.doc("$unicCode").set({
      'id' : "$unicCode",
      'name' : "${name}",
      'email' : "${email}"
    });

    await loadData();

    notifyListeners();
    return true;
  }

  Future<void> deleteData({required String id}) async {

    try{
      await dbReferance.doc(id).delete();
      await loadData();
    }catch(e){
      print(e);
    }

    notifyListeners();
  }
  Future<bool> UpdateData({required String id, required String name, required String email}) async {

    try{
      await dbReferance.doc(id).update({
        'name' : name,
        'email' : email,
      });
      await loadData();
    }catch(e){
      print(e);
    }

    notifyListeners();
    return true;
  }



}










