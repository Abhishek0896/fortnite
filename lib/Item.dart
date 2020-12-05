import 'package:flutter/material.dart';


class Item extends StatelessWidget {
  static const routeName = '/item';
  @override
  Widget build(BuildContext context) {
    final Map items = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text(items['name']),
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          elevation: 10,
          child:Row(
            children: <Widget>[
              Expanded(child:
              Image.network(items['images']['icon'],
              ),
              ),
              Text(items['name'])
            ],
          ),
        ),
      ),
    );
  }
}

// Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.center,
//
//     children:<Widget> [
//
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 10),
//   child : Text(
//             items['name'],style: TextStyle(color:Colors.white, fontSize: 18),
//          ),
//       ),
//     ],
// ),