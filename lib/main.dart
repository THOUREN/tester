import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  final int TaskNum = 1;
  final int counter = 0;
  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Question> questions = sample_data;
  int TaskNum = 1;
  int counter = 0;
  
  bool TaskState = false;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    Widget _Text(String worde) {
      return Padding(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Text(
          worde,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      );
    }

    Widget _button(int number) {
      String title = questions[TaskNum-1].options![number];
      int state = questions[TaskNum-1].answer![number];
      Color changedColor;
      if (state == 1)
        {
          changedColor = Colors.green;
        }
        else
        {
          changedColor = Colors.red;
        }
      

      return ElevatedButton(
        onPressed: () {
          return setState(() {

            if (state == 1 && !TaskState)
            {
              counter++;
            }
            TaskState = true;
            
          });
        },
        child: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(TaskState ? changedColor : color),
            ),
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('SOME'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _Text(questions[TaskNum-1].question!),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 170, 0, 0), child: _button(0)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(1)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(2)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(3)),
            
          ],
        ),
      ),
      bottomNavigationBar : Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          return setState(() {
                            if (TaskNum > 1)
                              TaskNum--;
                            TaskState = false;
                          });
                        },
                        child: Text('Назад',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Вопрос №$TaskNum',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          return setState(() {
                            if (TaskNum+1 <= questions.length)
                              TaskNum++;
                            TaskState = false;
                          });
                        },
                        child: Text('Вперёд',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
    );
  }
}


/*
void main() {
  runApp(Nav2App());
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('View Details'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return DetailScreen();
              }),
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
*/