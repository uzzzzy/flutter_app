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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext builder) {
                    return InputModal(id: index);
                  },
                );
              },
              title: Text('Item ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}

class InputModal extends StatelessWidget {
  final int id;

  const InputModal({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("Submit $id"),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
