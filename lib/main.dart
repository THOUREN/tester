import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  
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
            if (!TaskState)
            {
              questions[TaskNum-1].selected = number;

              if (state == 1 && !TaskState)
              {
                counter++;
              }
            }
            
          });
        },
        child: Text( (questions[TaskNum-1].selected != number) ? title : title+" (ваш ответ)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(TaskState ? changedColor : color),
            ),
      );
    }

    Widget _task(int _TaskNum) {



      return Column(
          children: <Widget>[
            _Text(questions[_TaskNum].question!),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 170, 0, 0), child: _button(0)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(1)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(2)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(3)),
            
          ],
        );
    }

    
    
    return Scaffold(
      appBar: AppBar(
        title: Row( children : [Text('Тест'),
                      if (TaskState)
                        Padding( padding : EdgeInsets.fromLTRB(100, 0, 0, 0), child : ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultScreen(counter : "$counter")));
                          },
                          child: Text('Окно результатов',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)),
                        ),)
                        ],
                        ),
        
        
      ),
      body: Center(
        child: _task(TaskNum-1),
      ),
      
      bottomSheet : Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          return setState(() {
                            if (TaskNum > 1)
                              TaskNum--;
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
                            else
                            {
                              TaskState = true;
                            }
                          });
                        },
                        child: Text(!TaskState ? ((TaskNum+1 <= questions.length)? 'Вперёд' : 'Закончить тест') : 'Вперёд',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),

                      
                    ],
                  ),
    );
  }
}

class ResultScreen extends StatelessWidget {

  String counter;
  ResultScreen({this.counter=''});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Ваш результат: "+ counter)
      ),
    );
  }
}
/*
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