import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leaderboard/constants.dart';
import 'package:leaderboard/quiz.dart';
import 'package:leaderboard/responsive.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

TextEditingController name = TextEditingController();

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFC3675A),
        child: Padding(
          padding: EdgeInsets.only(
            left: responsiveWidth(8, context),
            right: responsiveHeight(8, context),
            top: responsiveHeight(58, context),
            bottom: responsiveHeight(19, context),
          ),
          child: Container(
            height: responsiveHeight(735, context),
            width: responsiveWidth(296, context),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: responsiveHeight(30, context),
                ),
                Text(
                  'User Details',
                  style: TextStyle(
                    fontSize: responsiveText(20, context),
                    color: Color(0xFFC3675A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(20, context),
                ),
                SizedBox(
                  width: responsiveWidth(333, context),
                  height: responsiveHeight(72, context),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xFFC3675A),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xFFC3675A),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color(0xFFC3675A),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 235, 66, 43),
                        ),
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 182, 110, 100),
                        fontFamily: montserrat,
                        fontSize: responsiveText(14, context),
                      ),
                    ),
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 66, 43),
                      fontFamily: montserrat,
                      fontSize: responsiveText(14, context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizScreen(name: name.text)));
                  },
                  child: Container(
                    width: responsiveWidth(333, context),
                    height: responsiveHeight(72, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFC3675A),
                    ),
                    child: Center(
                      child: Text(
                        'Start Test',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsiveText(16, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(30, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
