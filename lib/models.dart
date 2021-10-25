import 'main.dart';

class Question{
  final int? id;
  final List<int>? answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.answer, this.options});
}

List<Question> sample_data = [  
  Question(
    answer: [0,1,0,0], 
    id: 1, 
    question: 'Flutter is an open-source UI software development kit created by ______', 
    options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
  ),

  
];

// {
//     "id": 2,
//     "question": "When google release Flutter.",
//     "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
//     "answer_index": 2,
//   },
//   {
//     "id": 3,
//     "question": "A memory location that holds a single letter or number.",
//     "options": ['Double', 'Int', 'Char', 'Word'],
//     "answer_index": 2,
//   },
//   {
//     "id": 4,
//     "question": "What command do you use to output data to the screen?",
//     "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
//     "answer_index": 2,
//   },