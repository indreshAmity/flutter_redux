import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:reduxExample/lib/utils.dart';
import 'package:reduxExample/redux/action.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'drawer_menu.dart';
import 'package:reduxExample/model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // @override
  // void initState() {
  //   super.initState();
  //   Preferences.getBackground_red_pref()
  //       .then((value) => {print("[init]" + value.toString()), redColor = value})
  //       .whenComplete(() => {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(123, 123, 12, 0.8),
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (context, state) {
          print("[Background R]" + state.getBackgroundColor_r.toString());
          return Container(
            color: Color.fromRGBO(
                state.getBackgroundColor_r.ceil(),
                state.getBackgroundColor_g.ceil(),
                state.getBackgroundColor_b.ceil(),
                0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text('Font Size: ${state.getViewFontSize.toInt()}',
                      style: TextStyle(
                        fontStyle:
                            state.italic ? FontStyle.italic : FontStyle.normal,
                        fontSize: state.getViewFontSize,
                      )),
                ),
                Slider(
                    min: 0.3,
                    value: state.slider,
                    onChanged: (newValue) {
                      StoreProvider.of<AppState>(context)
                          .dispatch(FontSize(newValue));
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Red",
                    style: TextStyle(fontSize: state.getViewFontSize),
                  ),
                ),
                Slider(
                    min: 0.3,
                    value: state.backGroundColor_r,
                    //redColor != null ? redColor : state.backGroundColor_r,
                    onChanged: (newVal) {
                      Preferences.setbackground_red_Pref(newVal);
                      // print("[Slider]" + newVal.toString());
                      StoreProvider.of<AppState>(context)
                          .dispatch(BackGroundColor_R(newVal));
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Green",
                    style: TextStyle(fontSize: state.getViewFontSize),
                  ),
                ),
                Slider(
                    min: 0.3,
                    value: state.backGroundColor_g,
                    onChanged: (newVal) {
                      print("[Slider]" + newVal.toString());
                      StoreProvider.of<AppState>(context)
                          .dispatch(BackGroundColor_G(newVal));
                    }),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Blue",
                    style: TextStyle(fontSize: state.getViewFontSize),
                  ),
                ),
                Slider(
                    min: 0.3,
                    value: state.backGroundColor_b,
                    onChanged: (newVal) {
                      print("[Slider]" + newVal.toString());
                      StoreProvider.of<AppState>(context)
                          .dispatch(BackGroundColor_B(newVal));
                    }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: state.bold,
                        onChanged: (newVal) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Bold(newVal));
                        },
                      ),
                      Text(
                        'Bold',
                        style: getStyle(state.bold, false),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: state.italic,
                          onChanged: (newVal) {
                            print(newVal);
                            StoreProvider.of<AppState>(context)
                                .dispatch(Italic(newVal));
                          }),
                      Text(
                        'Italic',
                        style: getStyle(false, state.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
