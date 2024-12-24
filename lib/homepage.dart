import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:persona/model/info.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  Future<List<Info>> getData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/users'));
    var jsonData = jsonDecode(response.body) as List;

    List<Info> informations = [];
    for (var eachInfo in jsonData) {
      final information = Info(
        name: eachInfo['name'],
        email: eachInfo['email'],
      );
      informations.add(information);
    }
    return informations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Info>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var informations = snapshot.data!;
              return RefreshIndicator(  // Add  pull down RefreshIndicator
                onRefresh: getData,
                child: ListView.builder(
                  itemCount: informations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          title: Text(informations[index].name),
                          subtitle: Text(informations[index].email),
                          leading: Icon(Icons.person),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No data found'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}