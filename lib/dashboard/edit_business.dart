import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
class EditBusiness extends StatelessWidget {
  const EditBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Edit Business",),
        leading: const AppBarBackButton(),),
    );
  }
}
