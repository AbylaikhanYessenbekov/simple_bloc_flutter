import 'package:bloc_counter_without_streams/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter with flutter_bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (BuildContext context) => ColorBloc(Colors.red),
        child: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
          child: BlocBuilder<ColorBloc, Color>(
            builder: (context, currentColor) => AnimatedContainer(
              height: 100,
              width: 100,
              color: currentColor,
              duration: Duration(microseconds: 500),
            ),
          ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.add(ColorEvent.EventRed);
            },
          ),
          SizedBox(height: 10.0,),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.add(ColorEvent.EventGreen);
            },
          ),
          SizedBox(height: 10.0,),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              _bloc.add(ColorEvent.EventBlue);
            },
          ),
          SizedBox(height: 10.0,),
          FloatingActionButton(
            backgroundColor: Colors.yellow,
            onPressed: () {
              _bloc.add(ColorEvent.EventYellow);
            },
          )
        ],
      ),
    );
  }
}


