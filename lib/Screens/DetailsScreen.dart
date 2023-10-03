import 'package:flutter/material.dart';
import '../model/DogModel.dart';

class DogDetails extends StatefulWidget {
  const DogDetails({super.key, required this.breed});
  final int breed;

  @override
  State<DogDetails> createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  late String name;
  late String imageURL;
  late String lifeLenghth;
  late String dogGroup;

  @override
  void initState() {
    super.initState();
    getBreedsData();
  }

  void getBreedsData() {
    for (int i = 0; i < DogModel.dogList.length; i++) {
      if (DogModel.dogList[i]['breeds'][0]['id'] == widget.breed) {
        name = DogModel.dogList[i]['breeds'][0]['name'];
        imageURL = DogModel.dogList[i]['url'];
        lifeLenghth = DogModel.dogList[i]['breeds'][0]['life_span'];
        dogGroup = DogModel.dogList[i]['breeds'][0]['breed_group'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageURL,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Text(
                lifeLenghth,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Text(
                dogGroup,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
