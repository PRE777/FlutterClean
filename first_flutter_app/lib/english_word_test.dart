import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart'; //导入Material UI组件库

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build (BuildContext context){  
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(0.8),
      child: new Text(wordPair.toString()),
    );
  }
}