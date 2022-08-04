import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pikachu_jump_practice/counter_cubit.dart';
import 'package:pikachu_jump_practice/stone_animation_controller.dart';

import 'pikachu_animation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child:  const MyHomePage(title: 'Pikachu Jump!')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          setState(() {
            selected = !selected;
          });
        },
        child:
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const PikachuAnimationControl(),
                const StoneAnimationControl(),
              ],))));
  }
}
