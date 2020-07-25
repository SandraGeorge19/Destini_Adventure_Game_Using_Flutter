import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      storyBrain.getChoice1(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
//              SizedBox(
//                height: 15.0,
//              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      color: Colors.blue,
                      child: Text(
                        storyBrain.getChoice2(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
