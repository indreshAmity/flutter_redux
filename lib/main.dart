import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:reduxExample/settings.dart';

import 'about.dart';
import 'home.dart';
import 'package:reduxExample/model/app_state.dart';
import 'package:reduxExample/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'lib/utils.dart';

void main() {
  AppState initialState = AppState(
    slider: 0.6,
    backGroundColor_r: 0.6,
    backGroundColor_g: 0.6,
    backGroundColor_b: 0.6,
  );
  Store<AppState> _store = Store<AppState>(reducer, initialState: initialState);

  runApp(MyApp(
    store: _store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
