import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_app_bar.dart';
import 'package:flutter_app/components/item_list.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        children: const [
          CustomAppBar(),
          ItemList(itemList: 1000),
        ],
      ),
    );
  }
}
