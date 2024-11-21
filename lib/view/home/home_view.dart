import 'package:flutter/material.dart';
import 'package:todo_app/view/widgets/common_appbar.dart';
import 'package:todo_app/view/widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(appBarTitle: "appBarTitle", context: context),
      body: Column(
        children: [],
      ),
    );
  }
}
