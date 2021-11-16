import 'package:flutter/cupertino.dart';

class GlobalVar {
  static ValueNotifier<int> lives = ValueNotifier<int>(3);
  static ValueNotifier<int> score = ValueNotifier<int>(0);
}
