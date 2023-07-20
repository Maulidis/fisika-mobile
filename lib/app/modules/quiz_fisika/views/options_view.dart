import 'dart:math';

import 'package:flutter/material.dart';

class OptionsView extends StatefulWidget {
  final List<Map<String, dynamic>> quiz;

  OptionsView({required this.quiz});

  @override
  _OptionsViewState createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  List<bool> selectedOptions = [];
  int correctCount = 0;
  int incorrectCount = 0;
  int currentQuestionIndex = 0;
  bool isQuizCompleted = false;
  bool isFirstQuiz = true;

  @override
  void initState() {
    super.initState();
    resetQuiz();
  }

  void resetQuiz() {
    setState(() {
      selectedOptions = List<bool>.filled(
        min(10, widget.quiz[currentQuestionIndex]['options'].length),
        false,
      );
      correctCount = 0;
      incorrectCount = 0;
      isQuizCompleted = false;
      shuffleQuiz(widget.quiz);
      currentQuestionIndex = 0;
    });
    isFirstQuiz = true;
  }

  void shuffleQuiz(List<Map<String, dynamic>> quiz) {
    final random = Random();
    for (var i = quiz.length - 1; i > 0; i--) {
      final j = random.nextInt(i + 1);
      final temp = quiz[i];
      quiz[i] = quiz[j];
      quiz[j] = temp;
    }
  }

  void checkAnswer() {
    final optionData = widget.quiz[currentQuestionIndex]['options']
        [selectedOptions.indexOf(true)] as Map<String, dynamic>;
    final optionIsCorrect = optionData['isCorrect'] as bool;
    if (optionIsCorrect) {
      correctCount++;
    } else {
      incorrectCount++;
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < min(10, widget.quiz.length) - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptions = List<bool>.filled(
          min(10, widget.quiz[currentQuestionIndex]['options'].length),
          false,
        );
      });
    } else {
      setState(() {
        isQuizCompleted = true;
        currentQuestionIndex = 0; // Tambahkan baris ini
      });
    }
  }

  void showResultDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Benar: $correctCount'),
              Text('Salah: $incorrectCount'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isQuizCompleted) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Options'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz selesai.'),
              ElevatedButton(
                onPressed: () {
                  resetQuiz();
                },
                child: Text('Mulai Ulang'),
              ),
            ],
          ),
        ),
      );
    }

    if (isFirstQuiz) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Options'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Klik tombol "Mulai" untuk memulai quiz.'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFirstQuiz = false;
                  });
                },
                child: Text('Mulai'),
              ),
            ],
          ),
        ),
      );
    }

    if (currentQuestionIndex >= min(10, widget.quiz.length)) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Options'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Quiz telah selesai.'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resetQuiz();
                  });
                },
                child: Text('Mulai Ulang'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.quiz[currentQuestionIndex]['question'],
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  min(10, widget.quiz[currentQuestionIndex]['options'].length),
              itemBuilder: (context, index) {
                final optionData = widget.quiz[currentQuestionIndex]['options']
                    [index] as Map<String, dynamic>;
                final optionText = optionData['text'] as String;
                return ListTile(
                  title: Text(
                    optionText,
                    style: TextStyle(
                      color:
                          selectedOptions[index] ? Colors.blue : Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedOptions = List<bool>.filled(
                        min(
                            10,
                            widget
                                .quiz[currentQuestionIndex]['options'].length),
                        false,
                      );
                      selectedOptions[index] = true;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer();
                nextQuestion();
                if (isQuizCompleted) {
                  showResultDialog(context);
                }
              },
              child: Text(currentQuestionIndex < min(10, widget.quiz.length) - 1
                  ? 'Next'
                  : 'Submit'),
            ),
          ),
        ],
      ),
    );
  }
}









// import 'package:flutter/material.dart';

// class OptionsView extends StatefulWidget {
//   final List<Map<String, dynamic>> quiz;

//   OptionsView({required this.quiz});

//   @override
//   _OptionsViewState createState() => _OptionsViewState();
// }

// class _OptionsViewState extends State<OptionsView> {
//   List<bool> selectedOptions = List<bool>.generate(
//     2, // Jumlah opsi, di sini diasumsikan ada 2 opsi
//     (_) => false,
//   );

//   int correctCount = 0;
//   int incorrectCount = 0;
//   int currentQuestionIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Options'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               widget.quiz[currentQuestionIndex][
//                   'question'], // Menampilkan pertanyaan berdasarkan indeks pertanyaan saat ini
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.quiz[currentQuestionIndex]['options'].length,
//               itemBuilder: (context, index) {
//                 final optionData = widget.quiz[currentQuestionIndex]['options']
//                     [index] as Map<String, dynamic>;
//                 final optionText = optionData['text'] as String;
//                 final optionIsCorrect = optionData['isCorrect'] as bool;
//                 return ListTile(
//                   title: Text(
//                     optionText,
//                     style: TextStyle(
//                       color:
//                           selectedOptions[index] ? Colors.blue : Colors.black,
//                     ),
//                   ),
//                   onTap: () {
//                     setState(() {
//                       // Mengatur status opsi yang dipilih
//                       selectedOptions = List<bool>.generate(
//                         widget.quiz[currentQuestionIndex]['options'].length,
//                         (i) => i == index,
//                       );
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (currentQuestionIndex < widget.quiz.length - 1) {
//                   setState(() {
//                     // Menghitung hasil
//                     for (int i = 0; i < selectedOptions.length; i++) {
//                       final optionData = widget.quiz[currentQuestionIndex]
//                           ['options'][i] as Map<String, dynamic>;
//                       final optionIsCorrect = optionData['isCorrect'] as bool;
//                       if (selectedOptions[i] && optionIsCorrect) {
//                         correctCount++;
//                       } else if (selectedOptions[i] && !optionIsCorrect) {
//                         incorrectCount++;
//                       }
//                     }

//                     // Reset status opsi yang dipilih
//                     selectedOptions = List<bool>.generate(
//                       widget.quiz[currentQuestionIndex + 1]['options'].length,
//                       (_) => false,
//                     );
//                     // Pindah ke pertanyaan berikutnya
//                     currentQuestionIndex++;
//                   });
//                 } else {
//                   // Menghitung hasil untuk pertanyaan terakhir
//                   for (int i = 0; i < selectedOptions.length; i++) {
//                     final optionData = widget.quiz[currentQuestionIndex]
//                         ['options'][i] as Map<String, dynamic>;
//                     final optionIsCorrect = optionData['isCorrect'] as bool;
//                     if (selectedOptions[i] && optionIsCorrect) {
//                       correctCount++;
//                     } else if (selectedOptions[i] && !optionIsCorrect) {
//                       incorrectCount++;
//                     }
//                   }

//                   // Menampilkan dialog hasil
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Result'),
//                         content: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text('Benar: $correctCount'),
//                             Text('Salah: $incorrectCount'),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }
//               },
//               child: Text(currentQuestionIndex < widget.quiz.length - 1
//                   ? 'Next'
//                   : 'Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
