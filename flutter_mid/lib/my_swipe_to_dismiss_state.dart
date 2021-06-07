import 'package:flutter/material.dart';

class MySwipeToDismissState extends StatefulWidget {
  const MySwipeToDismissState({Key? key}) : super(key: key);

  @override
  _MySwipeToDismissStateState createState() => _MySwipeToDismissStateState();
}

class _MySwipeToDismissStateState extends State<MySwipeToDismissState> {
  final items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySwipeToDismissState'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            background: Container(color: Colors.red,),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            key: Key(item),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        },
      ),
    );
  }
}
