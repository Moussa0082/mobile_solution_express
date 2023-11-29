

import 'package:flutter/material.dart';
import 'package:solution_express/Banques/AskFomrOneScreen.dart';
import 'package:solution_express/Banques/AskFormEnd.dart';
import 'package:solution_express/Banques/BankAskStateScreen.dart';
import 'package:solution_express/Banques/TypeInfoScreen.dart';
import 'package:solution_express/Banques/TypesScreen.dart';

final Map<String, WidgetBuilder> routes = {
//  QuizDetail.routeName : (BuildContext context) => QuizDetail(),
  // QuestionPage.routeName: (context) => QuestionPage(),
 ' /typeInfo':(context) => const TypeInfoScreen(),
 ' /typeScreen':(context) => const TypeScreen(),
 '/askOne':(context) => const AskFormOneScreen(),
 '/askTwo':(context) => const AskFormEnd(),
 '/askState': (context) => const BankAskStateScreen(),

} ;