import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { EventRed, EventGreen, EventBlue, EventYellow }

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.red;

  ColorBloc(Color initialState) : super(initialState);
  // Color get initialState => Colors.red;


  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // _color = (event == ColorEvent.EventGreen) ? Colors.green : Colors.red;
    switch(event){
      case ColorEvent.EventRed:
        _color = Colors.red;
        break;
      case ColorEvent.EventGreen:
        _color = Colors.green;
        break;
      case ColorEvent.EventBlue:
        _color = Colors.blue;
        break;
      case ColorEvent.EventYellow:
        _color = Colors.yellow;
        break;
    }
    yield _color;
  }


}
