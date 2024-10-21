import 'package:flutter/material.dart';

class Reorderabellist extends StatefulWidget {
  const Reorderabellist({super.key});

  @override
  State<Reorderabellist> createState() => _ReorderabellistState();
}

class _ReorderabellistState extends State<Reorderabellist> {
  final List<String> _productList = [
    'Apple',
    'banana',
    'orange',
    'pineApple',
    'watermealon',
    'cherry',
    'strabery',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reorderable List'),
        ),
        body: ReorderableListView.builder(
            itemBuilder: (context, index) {
              return Card(
                key: ValueKey(_productList[index]),
                child: ListTile(
                  title: Text(_productList[index]),
                ),
              );
            },
            itemCount: _productList.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex = oldIndex - 1;
                }
                final element = _productList.removeAt(oldIndex);
                _productList.insert(newIndex, element);
              });
            }));
  }
}
