import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class SplashModel extends ChangeNotifier {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  void initState(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
    unfocusNode.dispose();
  }
}
