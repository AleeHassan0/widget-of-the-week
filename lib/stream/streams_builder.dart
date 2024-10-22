import 'dart:async';

import 'package:flutter/material.dart';

class StreamsBuilder extends StatefulWidget {
  const StreamsBuilder({super.key});

  @override
  State<StreamsBuilder> createState() => _StreamsBuilderState();
}

class _StreamsBuilderState extends State<StreamsBuilder> {
  List<String> list = [];
  TextEditingController messageController = TextEditingController();
  StreamsSocket streamsSocket = StreamsSocket();
  Stream<DateTime> generateNumber() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield DateTime.now();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add("ali");
    streamsSocket.addResponse(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams Builder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder(
              stream: streamsSocket.getResponse,
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data![index].toString());
                      });
                }
              }),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Enter message'),
                ),
              ),
              IconButton(
                  onPressed: () {
                    list.add(messageController.text.toString());
                    streamsSocket.addResponse(list);
                  },
                  icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}

class StreamsSocket {
  final _stream = StreamController<List<String>>.broadcast();
  void Function(List<String>) get addResponse => _stream.sink.add;
  Stream<List<String>> get getResponse => _stream.stream.asBroadcastStream();
}
