// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:persona/homepage.dart';
// import 'package:http/http.dart' as http;
// import 'package:persona/model/info.dart';
//
// class Listpage extends StatelessWidget {
//    Listpage({super.key});
//
//    List informations = [];
//    //get data from api
//    Future getData() async {
//      var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/users'));
//      var jsonData = jsonDecode(response.body);
//
//      for (var eachInfo in jsonData['data']){
//        final information = Info(
//            name: eachInfo['name'],
//            email: eachInfo['email']
//        );
//        informations.add(information);
//      }
//      print(informations.length);
//    }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(future: getData(), builder: (context, snapshot){
//       if(snapshot.connectionState == ConnectionState.done){
//         return ListView.builder(
//
//             itemCount: informations.length,
//             itemBuilder: (context, index){
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey[200]
//                   ),
//                   child: ListTile(
//                     title: Text(informations[index].name),
//                     subtitle: Text(informations[index].email),
//                     leading: const Icon(Icons.person
//                     ),
//
//                   ),
//                 ),
//               );
//             }
//         );
//       }else{
//         return const Center(child: CircularProgressIndicator());
//       }
//     }
//     );
//   }
// }
