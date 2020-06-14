import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxExample/model/app_state.dart';

import 'drawer_menu.dart';
import 'lib/utils.dart';

const kAppTitle = 'States by Redux';
const kStateType = '...';

class Home extends StatelessWidget {
  final String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
          margin: EdgeInsets.all(10),
          child: StoreConnector<AppState, AppState>(
            builder: (context, state) {
              return GridView(
                // physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(2),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: [
                  button(),
                  button(),
                  button(),
                  button(),
                  button(),
                  button(),
                  button(),
                ],
              );
            },
            converter: (store) => store.state,
          )),
    );
  }

  double size() {
    double size;
    Preferences.getBackground_red_pref()
        .then((value) => {print(value), size = value});
    return size;
  }

  Widget button() {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Center(
        child: ButtonTheme(
          height: 100,
          minWidth: 20,
          child: RaisedButton(
            elevation: 12.0,

            // animationDuration: Duration(seconds: 1),
            // hoverColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Hello World!",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

// RichText(
//                 text: TextSpan(

//                   text: text,
//                   style: TextStyle(
//                       fontSize: size(),
//                       color: Colors.black,
//                       fontWeight:
//                           state.bold ? FontWeight.bold : FontWeight.normal,
//                       fontStyle:
//                           state.italic ? FontStyle.italic : FontStyle.normal),
//                 ),
//               );

// Center(
//                 child: ButtonTheme(
//                   height: 100,
//                   minWidth: 20,
//                   child: RaisedButton(
//                     elevation: 12.0,

//                     // animationDuration: Duration(seconds: 1),
//                     // hoverColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       "Hello World!",
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//               );
