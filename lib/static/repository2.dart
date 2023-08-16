

import 'package:flutter_pagination_example/model/character_summary.dart';

class MyRepository{
  
  Future<List<CharacterSummary>> fetchPalyListName(int pageKey, int pageSize) async{

    await Future.delayed(Duration(seconds: 2));

    List<CharacterSummary> list = [];
    list.add(new CharacterSummary(1 , "ali" ,"ali"));
    list.add(new CharacterSummary(1 , "reza" ,"ali"));
    list.add(new CharacterSummary(1 , "hasan" ,"ali"));
    list.add(new CharacterSummary(1 , "ali" ,"ali"));
    list.add(new CharacterSummary(1 , "reza" ,"ali"));
    list.add(new CharacterSummary(1 , "hasan" ,"ali"));
    list.add(new CharacterSummary(1 , "ali" ,"ali"));
    list.add(new CharacterSummary(1 , "reza" ,"ali"));
    
    return list;

  }
}