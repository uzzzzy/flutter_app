import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_app_bar.dart';
import 'package:flutter_app/components/item_list.dart';
import 'package:flutter_app/screens/second_screen.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    this.title = 'no tile',
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<List> listItem = loadData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4492F4),
      body: FutureBuilder(
        future: listItem,
        builder: (BuildContext contex, AsyncSnapshot<List> snapshot) {
          Widget children = snapshot.hasData
              ? Column(
                  children: [
                    const CustomAppBar(),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondScreen()),
                            );
                          },
                          child: const Text('secondScreen')),
                    ),
                    const ItemList(itemList: 1000),
                  ],
                )
              : Center(
                  child: Image.asset(
                    'assets/images/gif/loading.gif',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );

          return children;
        },
      ),
    );
  }
}

Future<List> loadData() =>
    Future.delayed(const Duration(seconds: 4), () => ['hello', 'this', 'is']);
