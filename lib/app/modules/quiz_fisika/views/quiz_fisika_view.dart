import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fisika_mobile_app/app/modules/quiz_fisika/views/options_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constans.dart';
import '../controllers/quiz_fisika_controller.dart';

class QuizFisikaView extends GetView<QuizFisikaController> {
  QuizFisikaController get quizC => Get.put(QuizFisikaController());

  const QuizFisikaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: const BoxDecoration(
                color: kBg,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Quiz Fisika',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      color: KColorDark,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: quizC.streamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listAllDocs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: listAllDocs.length,
                      itemBuilder: (context, index) {
                        var quizData =
                            listAllDocs[index].data() as Map<String, dynamic>;
                        var quiz = (quizData['quiz'] as List<dynamic>)
                            .cast<Map<String, dynamic>>();
                        return GestureDetector(
                          onTap: () {
                            Get.to(OptionsView(
                              quiz: quiz,
                              //  questionsPerSession: 5,
                            ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kWhite,
                            ),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Image.asset('assets/images/atom 1.png',
                                      width: 80, height: 80),
                                  SizedBox(width: 20),
                                  Flexible(
                                    child: Container(
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '${quizData['title']}',
                                              style: TextStyle(
                                                  color: KColorDark,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 20),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              '${quizData['about']}',
                                              style: TextStyle(
                                                   color: KColorDark,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Transform.scale(
                                        scale: 0.8,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.teal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
