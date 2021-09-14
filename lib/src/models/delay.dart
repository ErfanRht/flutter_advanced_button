part of '../../flutter_advanced_button.dart';

Future<bool> Delay({@required time}) async {
  await Future.delayed(Duration(milliseconds: time));
}
