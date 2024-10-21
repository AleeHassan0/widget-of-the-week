import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencess extends StatefulWidget {
  const Sharedpreferencess({super.key});

  @override
  State<Sharedpreferencess> createState() => _SharedpreferencessState();
}

class _SharedpreferencessState extends State<Sharedpreferencess> {
  String name = '';

  ///init function, Widget build hony sy phly hi call ho jata h.
  @override
  void initState() {
    super.initState();
    login();
  }

  void login() async {
    ///async es ly kiya gya kyo k sharedpreference future function h,hymy nhi pta yh kitni daar main build ho jay ga
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared preferences'),
      ),
      body: Column(
        children: [Text(name.toString())],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setBool('ismarried', false);
          sp.setDouble('luckynumber', 9.9);
          sp.setInt('age', 20);
          sp.setString('name', 'hassan');
          name = sp.getString('name') ?? 'kjfsk';
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
