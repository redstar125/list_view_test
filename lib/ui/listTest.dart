import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class  test_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "List",
    home: new RandomWords(),
    );
  }

}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}

class RandomWordsState extends State <RandomWords> {
final _suggestion = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("List App"),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions(){
    // TODO: implement build
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, position) {
        if (position.isOdd) return new Divider();
        final index = position ~/ 2;
        if (index >= _suggestion.length) {
          _suggestion.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestion[index]);
      },
    );
  }
Widget _buildRow (WordPair suggestion) {
  return new ListTile(
    title: Text(suggestion.asPascalCase, style: TextStyle(fontSize: 10.0),),
  );
}
}


