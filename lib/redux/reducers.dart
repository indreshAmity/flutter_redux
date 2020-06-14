import 'action.dart';
import 'package:reduxExample/model/app_state.dart';

AppState reducer(AppState oldState, dynamic action) {
  AppState newState = AppState.copyWith(oldState);

  if (action is FontSize) {
    newState.slider = action.size;
  } else if (action is Bold) {
    newState.bold = action.bold;
  } else if (action is Italic) {
    newState.italic = action.italic;
  } else if (action is BackGroundColor_B) {
    newState.backGroundColor_b = action.b;
  } else if (action is BackGroundColor_G) {
    newState.backGroundColor_g = action.g;
  } else if (action is BackGroundColor_R) {
    newState.backGroundColor_r = action.r;
  }
  return newState;
}
