import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../model/DogModel.dart';
import 'ListScreen.dart';
import 'package:http/http.dart' as http;

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({super.key});

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  void initState() {
    super.initState();
    getDogList();
  }

  Future getDogList() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.thedogapi.com/v1/images/search?limit=100&order=ASC&has_breeds=1&api_key=live_qRXpNifBtKwTMbyv2Bc2UyQbzZigmXuQcTB8T9Pu2uxOe6tzz1xi80aUZjsxakqa'));
    if (response.statusCode == 200) {
      // print(response.body);

      var dogBreeds = await jsonDecode(response.body);

      if (dogBreeds != 0) {
        DogModel.dogList = dogBreeds;
        if (DogModel.dogList.length > 0) {
          // print(DogModel.dogList.length);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ListScreen()));
        }
      }
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: const Color(0xFFEA3799),
          size: 200,
        ),
      ),
    );
  }
}
