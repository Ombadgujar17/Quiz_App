import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      'question': 'Which gas is most abundant in the Earths atmosphere?',
      'option': ['Oxygen', 'Hydrogen', 'Carbon Dioxide', 'Nitrogen'],
      'correctAnswer': 3,
    },
    {
      'question': 'What is the powerhouse of the cell?',
      'option': ['Nucleus', 'Ribosome', 'Mitochondrion', 'Cell Wall'],
      'correctAnswer': 2,
    },
    {
      'question': 'Who was the first Prime Minister of India?',
      'option': [
        'Mahatma Gandhi',
        'Sardar Vallabhbhai Patel',
        'Jawaharlal Nehru',
        'Dr. B. R. Ambedkar',
      ],
      'correctAnswer': 2,
    },
    {
      'question':
          'What is the value of the mathematical constant pi to two decimal places?',
      'option': ['3.12', '3.14', '3.16', '3.18'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'option': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      'correctAnswer': 1,
    },
  ];
  int currentQuestionIndex = 0;
  int selectedQuestionIndex = -1;
  bool isQuestionPage = true;
  int count = 0;

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedQuestionIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]['correctAnswer']) {
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedQuestionIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return quizAppPage();
  }

  Scaffold quizAppPage() {
    if (isQuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            SizedBox(height: 15),
            SizedBox(
              child: Center(
                child: Text(
                  "Question: ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 21),
                SizedBox(
                  width: 390,
                  height: 70,
                  child: Text(
                    "${allQuestions[currentQuestionIndex]['question']}",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(0)),
                onPressed: () {
                  if (selectedQuestionIndex == -1) {
                    selectedQuestionIndex = 0;
                    if (selectedQuestionIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "${allQuestions[currentQuestionIndex]['option'][0]}",
                  style: TextStyle(fontSize: 22, color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectedQuestionIndex == -1) {
                    selectedQuestionIndex = 1;
                    if (selectedQuestionIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "${allQuestions[currentQuestionIndex]['option'][1]}",
                  style: TextStyle(fontSize: 22, color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectedQuestionIndex == -1) {
                    selectedQuestionIndex = 2;
                    if (selectedQuestionIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "${allQuestions[currentQuestionIndex]['option'][2]}",
                  style: TextStyle(fontSize: 22, color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(3)),
                onPressed: () {
                  if (selectedQuestionIndex == -1) {
                    selectedQuestionIndex = 3;
                    if (selectedQuestionIndex ==
                        allQuestions[currentQuestionIndex]['correctAnswer']) {
                      count++;
                    }
                    setState(() {});
                  }
                },
                child: Text(
                  "${allQuestions[currentQuestionIndex]['option'][3]}",
                  style: TextStyle(fontSize: 22, color: Colors.orange),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedQuestionIndex != -1) {
              if (currentQuestionIndex < (allQuestions.length - 1)) {
                currentQuestionIndex++;
                selectedQuestionIndex = -1;
              } else {
                isQuestionPage = false;
              }
              setState(() {});
            }
          },
          backgroundColor: Colors.orange,
          child: Text("Next"),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 250),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgINDID0aPbQoV3wKa88n158oZtdCjxHUBlQ&s",
              ),
              Text("Congratulations", style: TextStyle(fontSize: 30)),
              SizedBox(height: 30,),
              Text("Your Score Is: $count",style:TextStyle(fontSize:30))
            ],
          ),
        ),
      );
    }
  }
}
