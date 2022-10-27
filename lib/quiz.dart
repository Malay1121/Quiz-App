import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:leaderboard/questions.dart';
import 'package:leaderboard/responsive.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

String moneyData = '{"money":600}';
var mentorChannel;
var getReq;

int index = 0;
int right = 0;

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState

    // mentorChannel = WebSocketChannel.connect(
    //     Uri.parse('ws://172.105.41.217:8000/ws/${widget.name}'));
    // mentorChannel.stream.listen((event) async {
    //   setState(() {
    //     String finalData = event.toString();

    //     moneyData = finalData.toString();
    //   });
    //   if (moneyData == '{"event": "end_auction"}') {
    //     getReq = await http.get(
    //       Uri.parse('http://172.105.41.217:8000/show_teams'),
    //     );
    //     setState(() {
    //       var teamData = jsonDecode(getReq.body);
    //     });

    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Text('See your team on the screen!'),
    //       ),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC3675A),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 10,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Text(
                      '$right/10',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
              child: Text(
                quiz[index]['question'].toString(),
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.white,
                  fontSize: responsiveText(20, context),
                  color: Color(0xFFC3675A),
                  backgroundColor: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (quiz[index]['answer'] == 1) {
                        right++;

                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/correct.png');
                            }));
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/wrong.png');
                            }));
                      }
                      Timer.periodic(Duration(seconds: 3), (done) {
                        Navigator.pop(context);
                      });
                      setState(() {
                        index++;
                      });
                    },
                    child: Card(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          quiz[index]['1'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: responsiveText(15, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (quiz[index]['answer'] == 2) {
                        right++;
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/correct.png');
                            }));
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/wrong.png');
                            }));
                      }
                      Timer.periodic(Duration(seconds: 3), (done) {
                        Navigator.pop(context);
                      });
                      setState(() {
                        index++;
                      });
                    },
                    child: Card(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          quiz[index]['2'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: responsiveText(15, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (quiz[index]['answer'] == 3) {
                        right++;
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/correct.png');
                            }));
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/wrong.png');
                            }));
                      }
                      Timer.periodic(Duration(seconds: 3), (done) {
                        Navigator.pop(context);
                      });
                      setState(() {
                        index++;
                      });
                    },
                    child: Card(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          quiz[index]['3'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: responsiveText(15, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      if (quiz[index]['answer'] == 4) {
                        right++;
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/correct.png');
                            }));
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Image.asset('assets/wrong.png');
                            }));
                      }
                      Timer.periodic(Duration(seconds: 3), (done) {
                        Navigator.pop(context);
                      });
                      setState(() {
                        index++;
                      });
                    },
                    child: Card(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          quiz[index]['4'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: responsiveText(15, context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
