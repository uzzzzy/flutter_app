import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/users.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late List<Users> _users = <Users>[];
  Future<List> getData() async {
    http.Response response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {"Accept": "application/json"},
    );
    List data = jsonDecode(response.body);

    return Future.delayed(Duration(seconds: 5), () {
      return data;
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    getData().then((data) => {
          for (var element in data)
            {
              _users.add(Users.fromJson(element)),
            }
        });
    return GestureDetector(
      onDoubleTap: () => {Navigator.pop(context)},
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Second Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black45,
                  ),
                ),
              ),
              Flexible(
                  child: FutureBuilder<List<dynamic>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Users user = Users.fromJson(snapshot.data?[index]);
                          return Container(
                            child: Text(
                              '${user.name}',
                              style: TextStyle(
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black54,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
