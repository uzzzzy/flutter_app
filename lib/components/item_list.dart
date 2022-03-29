import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final int itemList;

  const ItemList({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemList,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListTile(
              title: Text('Item ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
