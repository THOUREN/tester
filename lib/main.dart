import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MaterialApp(home: App(),));
}



class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Question> questions = sample_data ;
  int count=0;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    
 


    Widget _Text(String worde){
      return Padding(
        padding: EdgeInsets.only(top: 30,right: 20,left: 20),
         child: Text(worde,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),
         ),
         );
    }

    Widget _button(int number){
      
      String title = questions[count].options![number];
      int state = questions[count].answer![number];
      return ElevatedButton(
        
        onPressed: ( ){

          setState(() {
            if (state == 1)
            {
              title = "+++";
            }
            else
            {
              title ="---";
            }     
          });
          
      
      }, 
      child: Text (title ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40)),
      
        );
    }
    return Scaffold(
      appBar: AppBar(
        title:Text('SOME') ,
        ),
        body: Center(
          child:Column(
            children: <Widget>[
              _Text(questions[count].question!),
              Padding(padding: EdgeInsets.fromLTRB(0, 170, 0, 0),
              child: _button(0)),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: _button(1)),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: _button(2)),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: _button(3)),
            ],
          ) ,),
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