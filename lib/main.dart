import 'package:bloc_pattern/article_list_screen.dart';
import 'package:bloc_pattern/bloc/article_list_bloc.dart';
import 'package:bloc_pattern/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ArticleListBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ArticleListScreen(),
      ),
    );
  }
}

