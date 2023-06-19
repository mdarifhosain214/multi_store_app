import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
class SupplierStatics extends StatelessWidget {
  const SupplierStatics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Statics",),
        leading: const AppBarBackButton(),),
    );
  }
}
