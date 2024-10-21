import 'package:flutter/material.dart';

class FutureFnction extends StatefulWidget {
  const FutureFnction({super.key});

  @override
  State<FutureFnction> createState() => _FutureFnctionState();
}

class _FutureFnctionState extends State<FutureFnction> {
  Future<DateTime> futureFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    return DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Function'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text("Click")),
          FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  return Center(child: Text(snapshot.data.toString()));
                } else {
                  return Text(snapshot.connectionState.toString());
                }
              })
        ],
      ),
    );
  }
}
