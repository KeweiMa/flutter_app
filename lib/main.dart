import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'flutter App',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            ),
            home: HomePage(),
        ),
      );
  }
}

class AppState extends ChangeNotifier {
  var current = WordPair.random();
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var appState = context.watch<AppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea: '),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}