import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class Countrycodepicker extends StatefulWidget {
  const Countrycodepicker({super.key});

  @override
  State<Countrycodepicker> createState() => _CountrycodepickerState();
}

class _CountrycodepickerState extends State<Countrycodepicker> {
  String Countryphone = '';
  String phoneCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country code picker"),
      ),
      body: Column(
        children: [
          Text(Countryphone.toString()),
          Text(phoneCode.toString()),
          TextButton(
              onPressed: () {
                showCountryPicker(
                    context: context,
                    onSelect: (Country value) {
                      print(value.countryCode.toString());
                      print(value.phoneCode.toString());
                      Countryphone = value.countryCode.toString();
                      phoneCode = value.phoneCode.toString();
                      setState(() {});
                    });
              },
              child: const Text('Tap'))
        ],
      ),
    );
  }
}
