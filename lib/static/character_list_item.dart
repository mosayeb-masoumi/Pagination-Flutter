
import 'package:flutter/material.dart';
import '../model/character_summary.dart';

class CharacterListItem extends StatelessWidget {
  final CharacterSummary character;
  final int index;
  const CharacterListItem({Key? key, required this.character, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
       margin: EdgeInsets.only(bottom: 50),
        padding: EdgeInsets.all(20),
        child: Text(character.name+index.toString() , style: TextStyle(fontSize: 15),),
      );


  }

}
