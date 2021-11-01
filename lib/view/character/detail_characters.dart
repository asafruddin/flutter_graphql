import 'package:flutter/material.dart';

class DetailCharacters extends StatefulWidget {
  const DetailCharacters({Key? key}) : super(key: key);

  @override
  _DetailCharactersState createState() => _DetailCharactersState();
}

class _DetailCharactersState extends State<DetailCharacters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Character")), body: Container());
  }
}
