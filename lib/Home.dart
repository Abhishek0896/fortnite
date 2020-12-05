import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fortnite/Item.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List rawData=[];
//   getData() async{
//   var response = await Dio().get("https://fortnite-api.theapinetwork.com/store/get");
//   print(response.data['data'][0]['itemId']);
//   return response.data;
//   }
//
//
//   @override
//   void initState() {
//     getData().then((data) {
//       setState(() {
//         rawData = data;
//       });
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       title: Text('Hello World'
//       ),
//     ),
//       body: Container(
//           child: GridView.builder(
//             itemCount: rawData.length,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//     itemBuilder: (BuildContext context, int index){
//       return GestureDetector(
//       onTap: (){},
//       child: Card(
//         elevation: 10,
//           child:Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//              child: Text(rawData[index]['name'],style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             );
//             },),
//             ),
//           );
//   }
// }

    // children: rawData.map((e){
    //   Card(
    //     color: Colors.blue,
    //     elevation:10,
    //     child: Center(child: Text(e.toString(),
    //       style: TextStyle(color: Colors.white, fontSize: 18),
    //              ),
    //           ),
    //         );
    //      }).toList(),
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List rawData=[];
  getData() async{
  var response = await Dio().get("https://fortnite-api.theapinetwork.com/store/get");
  return response.data['data'];
  }

  @override
  void initState() {
    getData().then((data) {
      setState(() {
        rawData = data;
      });
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: rawData.length >0 ?GridView.builder(
          itemCount: rawData.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
    return GestureDetector(
    onTap: (){
      Navigator.of(context).pushNamed(Item.routeName,
          arguments: rawData[index]['item']);
    },
    child:Card(
      color: Colors.blue,
      elevation: 10,
      child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Center(
                child: Text(
                  rawData[index]['item']['name'],style: TextStyle(color:Colors.white, fontSize: 18),
                  ),
              ),
              ),
            ),
          );
        },):
        Center(
          child: CircularProgressIndicator(),
        ),
    ),
    );
  }
}
