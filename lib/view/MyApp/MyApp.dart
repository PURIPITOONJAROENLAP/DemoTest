import 'package:facebook/bloc/home_bloc.dart';
import 'package:facebook/view/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<CounterBloc>(
              create: (_) => CounterBloc(),
            ),
          ],
          child: HomeScreen(),
        ),
        debugShowCheckedModeBanner: false,
      );
  }
}
