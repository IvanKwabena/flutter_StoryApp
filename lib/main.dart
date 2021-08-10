import 'package:flutter/material.dart';
import 'package:flutter_story_game/storybrain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain _storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/background.jpg'),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  _storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _storyBrain.nextStory(1);
                  });
                },
                child: Text(
                  _storyBrain.getChoice1(),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Visibility(
                visible: _storyBrain.buttonVisible(),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _storyBrain.nextStory(2);
                    });
                  },
                  child: Text(
                    _storyBrain.getChoice2(),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
